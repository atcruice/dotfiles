if empty(glob("~/.vim/autoload/plug.vim"))
  silent !echo "Installing vim-plug..."
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin("~/.vim/plugged")
