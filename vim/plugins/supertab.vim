Plugin 'ervandew/supertab'
Plugin 'szw/vim-kompleter'

let g:SuperTabDefaultCompletionType = "<C-X><C-U>"
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "<CR>"
