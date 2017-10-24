" search for visually selected text
vnoremap // y/<C-R>"<CR>

" disable Ex mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" disable adding and subtracting
nnoremap <C-a> <Nop>
nnoremap <C-x> <Nop>

" on-demand clang-format
map <Leader>cff :pyf /usr/local/opt/clang-format/share/clang/clang-format.py<CR>

" copy full path of current buffer to system clipboard
map <Leader>cfp :let @+ = expand("%:p")
