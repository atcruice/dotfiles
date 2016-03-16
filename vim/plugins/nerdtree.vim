Plugin 'scrooloose/nerdtree'
noremap <Leader>. :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeFind<CR>
let g:loaded_netrw = 1 " Disable netrw
let g:loaded_netrwPlugin = 1 " Disable netrw
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeMinimalUI = 1 " Disable help message
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinPos = 'right'
let NERDTreeIgnore=['\.xcodeproj$[[dir]]', '\.class$[[file]]', '\.o$[[file]]']
