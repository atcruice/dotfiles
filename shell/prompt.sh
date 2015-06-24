# ANSI escape aliases
RESET="\033[0m"
BOLD_ON="\033[1m"
# BOLD_OFF="\033[22m"
# ITALIC_ON="\033[3m"
# ITALIC_OFF="\033[23m"
# UL_ON="\033[4m"
# UL_OFF="\033[24m"
# BLINK_ON="\033[5m"
# BLINK_OFF="\033[25m"
# INVERT_ON="\033[7m"
# INVERT_OFF="\033[27m"
FG_BLACK="\033[30m"
FG_RED="\033[31m"
FG_GREEN="\033[32m"
# FG_YELLOW="\033[33m"
# FG_BLUE="\033[34m"
# FG_MAGENTA="\033[35m"
# FG_CYAN="\033[36m"
# FG_LIGHT_GREY="\033[37m"
# FG_DARK_GREY="\033[90m"
# FG_LIGHT_RED="\033[91m"
# FG_LIGHT_GREEN="\033[92m"
# FG_LIGHT_YELLOW="\033[93m"
# FG_LIGHT_BLUE="\033[94m"
# FG_LIGHT_MAGENTA="\033[95m"
# FG_LIGHT_MAGENTA="\033[96m"
# FG_WHITE="\033[97m"
# BG_BLACK="\033[40m"
# BG_RED="\033[41m"
# BG_GREEN="\033[42m"
# BG_YELLOW="\033[43m"
# BG_BLUE="\033[44m"
# BG_MAGENTA="\033[45m"
# BG_CYAN="\033[46m"
# BG_LIGHT_GREY="\033[47m"
# BG_DARK_GREY="\033[100m"
BG_LIGHT_RED="\033[101m"
# BG_LIGHT_GREEN="\033[102m"
BG_LIGHT_YELLOW="\033[103m"
# BG_LIGHT_BLUE="\033[104m"
BG_LIGHT_MAGENTA="\033[105m"
BG_LIGHT_CYAN="\033[106m"
# BG_WHITE="\033[107m"

function user_host {
  local user=""
  local host=""

  if [[ "$(id -un)" != "alexcruice" ]]; then
    user="\u"
  fi

  if [[ "$(hostname -s)" != "$(scutil --get ComputerName)" ]]; then
    host="@\h"
  fi

  if [[ -n $user || -n $host ]]; then
    echo "\[$FG_BLACK\]\[$BG_LIGHT_MAGENTA\] $user$host \[$RESET\]"
  else
    echo ""
  fi
}

function which_ruby {
  if [[ -n $RUBY_VERSION ]]; then
    echo "\[$FG_BLACK\]\[$BG_LIGHT_RED\] $RUBY_VERSION \[$RESET\]"
  else
    echo ""
  fi
}

function current_dir {
  echo "\[$FG_BLACK\]\[$BG_LIGHT_CYAN\] \w \[$RESET\]"
}

function git_info {
  # check if we're in a git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # quickest check for what branch we're on
  local branch
  branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

  # check if it's dirty (via github.com/sindresorhus/pure)
  local dirty
  dirty=$(git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ]&& echo -e "*")

  echo "\[$FG_BLACK\]\[$BG_LIGHT_YELLOW\] $branch$dirty \[$RESET\]"
}

function exit_good {
  echo "$(user_host)$(which_ruby)$(current_dir)$(git_info)$(printf \"\\n\")\[$BOLD_ON\]\[$FG_GREEN\]\$ \[$RESET\]"
}

function exit_bad {
  echo "$(user_host)$(which_ruby)$(current_dir)$(git_info)$(printf \"\\n\")\[$BOLD_ON\]\[$FG_RED\]\$ \[$RESET\]"
}

function custom_prompt {
  PS1="\`if [ \$? = 0 ]; then echo $(exit_good); else echo $(exit_bad); fi\`"
}

PROMPT_COMMAND="custom_prompt; history -a; $PROMPT_COMMAND"
