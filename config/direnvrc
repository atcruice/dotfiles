layout_haskell() {
  PATH_add ~/.cabal/bin
  [ -d .cabal-sandbox ] || cabal sandbox init
  PATH_add .cabal-sandbox/bin
  GHC_PACKAGE_PATH=$(cabal exec -- sh -c "echo \$GHC_PACKAGE_PATH")
  export GHC_PACKAGE_PATH
}

add_extra_vimrc() {
  local extravim
  extravim="$(find_up .vimrc)"

  if [ -n "$extravim" ]; then
    echo "Adding extra .vimrc: ${extravim}"
    path_add EXTRA_VIM "$extravim"
  fi
}
