tmux() {
  direnv exec / tmux "$@" # effectively unload direnv before executing tmux
}

open_last_migration() {
    $EDITOR db/migrate/$(ls db/migrate | sort | tail -1)
}
