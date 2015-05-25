stty -ixon

output_warning() {
  echo -e "\033[1m\033[33mWarning:\033[0m $*"
}

source_this() {
  local -r file_to_source=${1:-}
  local -r failure_message=${2:-}
  { [[ -r $file_to_source ]] && source "$file_to_source"; } || output_warning "$failure_message"
}

eval "$(direnv hook $0)"
source_this "$HOME/.bashrc" "$HOME/.bashrc not found"
source_this "$(brew --prefix)/etc/bash_completion" 'bash-completion not found'
