tmux() {
  direnv exec / tmux # effectively unload direnv before executing tmux
}

which_git_repo() {
  git rev-parse --show-toplevel
}
