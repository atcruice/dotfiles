# colours
BLACK=$(tput setaf 0)
BRIGHT_BLACK=$(tput setaf 8)
RED=$(tput setaf 1)
BRIGHT_RED=$(tput setaf 9)
GREEN=$(tput setaf 2)
BRIGHT_GREEN=$(tput setaf 10)
YELLOW=$(tput setaf 3)
BRIGHT_YELLOW=$(tput setaf 11)
BLUE=$(tput setaf 4)
BRIGHT_BLUE=$(tput setaf 12)
MAGENTA=$(tput setaf 5)
BRIGHT_MAGENTA=$(tput setaf 13)
CYAN=$(tput setaf 6)
BRIGHT_CYAN=$(tput setaf 14)
WHITE=$(tput setaf 7)
BRIGHT_WHITE=$(tput setaf 15)
RESET=$(tput sgr0)

function user_hostname() {
  if [[ "alexc" == "${USER}" ]]; then
    user=""
  else
    user="\u"
  fi

  if [[ "$(scutil --get ComputerName).local" == "${HOSTNAME}" ]]; then
    host=""
  else
    host="@\h"
  fi

  if [[ -z $user && -z $host ]]; then
    echo ""
  else
    echo "\[${MAGENTA}\]${user}${host} "
  fi
}

function git_info() {
  # check if we're in a git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # quickest check for what branch we're on
  branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

  # check if it's dirty (via github.com/sindresorhus/pure)
  dirty=$(git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ]&& echo -e "*")

  echo "\[${YELLOW}\]${branch}${dirty} "
}

function exit_status() {
  if [[ $? == 0 ]]; then
    PS1="$(user_hostname)\[${CYAN}\]\w $(git_info)\[${GREEN}\]\$\[${RESET}\] "
  else
    PS1="$(user_hostname)\[${CYAN}\]\w $(git_info)\[${RED}\]\$\[${RESET}\] "
  fi
}

# custom prompt
PROMPT_COMMAND=exit_status

# aliases
alias ls="ls -Alh"

# exports
export CLICOLOR=1
export NXJ_HOME="/Applications/leJOS_NXJ_0.9.1beta-3"
export NDK_CCACHE=/opt/local/bin/ccache # C complier caching
export NUM_CPUS=4
export MASH_ENV_PATH="/Applications/mash-snow-leopard/env"
PATH="$PATH:$NXJ_HOME/bin"
PATH="$PATH:/Applications/mash-snow-leopard/bin"
PATH="$PATH:/Applications/eclipse"
PATH="$PATH:/usr/local/mysql/bin"
PATH="$PATH:/Applications/androidsdk/tools:/Applications/androidsdk/platform-tools"
PATH="$PATH:/opt/local/bin:/opt/local/sbin:" # MacPorts
PATH="$PATH:/usr/local/mongodb/bin"
export PATH

# init rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# SSH changes
SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
  echo "Initializing new SSH agent..."
  # spawn ssh-agent
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi
