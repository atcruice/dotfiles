Plugin 'itchyny/lightline.vim'
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'tender' }

if !has('gui_running')
  set t_Co=256
endif
