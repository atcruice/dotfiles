# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alexcruice"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew cabal npm tmux rvm sublime)

source "$ZSH/oh-my-zsh.sh"

# User configuration
setopt correct
# setopt correctall
setopt globdots
setopt ignoreeof
setopt noclobber

# aliases
alias ls="ls -A"
alias lsl="ls -Alh"
alias wgit="git rev-parse --show-toplevel"
alias vundle="vim +PluginInstall +qall"

# exports
export EDITOR='vim'
export CLICOLOR=1
export NUM_CPUS="sysctl -n hw.ncpu 2>/dev/null || grep processor -c /proc/cpuinfo"
export HOMEBREW_GITHUB_API_TOKEN="1d12e6e83d151cf9b4da173bbbb7f07d9f7ffb14" # improve brew github API access
PATH="/usr/local/opt/ccache/libexec:$PATH" # ccache
PATH="$PATH:/usr/local/mysql/bin"
PATH="$PATH:/usr/local/mongodb/bin"
PATH="$PATH:/usr/local/heroku/bin"
PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"
PATH="/usr/local/bin:/usr/local/sbin:$PATH" # TODO: find origin of duplicate augmentation
PATH="$HOME/.cabal/bin:$PATH"
export PATH

eval "$(direnv hook $0)"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
