tmux() {
  echo 'functions override'
  direnv exec / tmux # effectively unload direnv before executing tmux
}
