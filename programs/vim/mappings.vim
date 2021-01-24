" search for visually selected text
vnoremap // y/<C-R>"<CR>

" disable Ex mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" disable adding and subtracting
nnoremap <C-a> <Nop>
nnoremap <C-x> <Nop>

" copy full path of current buffer to system clipboard
map <Leader>cfp :let @+ = expand("%:p")<CR>

" improve wrapped line nagivation
map j gj
map k gk
