tmux() {
  direnv exec / tmux "$@" # effectively unload direnv before executing tmux
}
