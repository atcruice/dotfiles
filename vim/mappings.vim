" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv
" Don't use Ex mode, use Q for formatting
map Q gq
" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo, so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
nnoremap <Leader>/ :nohlsearch<CR><C-L>
" Close quickfix window
map <Leader>k :ccl<CR>
" Select all
map <Leader>a ggVG
" Movement & wrapped long lines
nnoremap j gj
nnoremap k gk
" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Jump to start and end of line using the home row keys
noremap H ^
noremap L $
" Highlight word at cursor without changing position
nnoremap <Leader>h *<C-O>
" Yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$
" Yank and put system pasteboard with <Leader>y/p.
nnoremap <Leader>yy "*yy
noremap <Leader>P "*P
noremap <Leader>Y "*y$
noremap <Leader>p "*p
noremap <Leader>y "*y
" Copy relative path to the system pasteboard
nnoremap <Leader>cf :let @*=expand('%')<CR>
" Copy relative path and line number to the system pasteboard
nnoremap <Leader>cl :let @*=expand('%').':'.line('.')<CR>
" quick mapping to execute the macro in q
noremap <Leader>q @q
" fast save
nnoremap <Leader>w :w<CR>
" fast buffer close
nnoremap <Leader>x :bw<CR>
" sort selection
vnoremap <Leader>s :sort<CR>
" jump to end of paste
vnoremap y y`]
vnoremap p p`]
nnoremap p p`]
