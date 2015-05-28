output_warning() {
  echo -e "\033[1m\033[33mWarning:\033[0m $*"
}

source_this() {
  local file_to_source=${1:-}
  local failure_message=${2:-}

  if [[ -r $file_to_source ]]
  then
    source "$file_to_source"
  else
    output_warning "$failure_message"
  fi
}

tmux() {
  direnv exec / tmux "$@" # effectively unload direnv before executing tmux
}

which_git_repo() {
  git rev-parse --show-toplevel
}
