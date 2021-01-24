colorscheme jellybeans

highlight Search ctermbg=DarkRed ctermfg=white

set breakindent
set breakindentopt=shift:2
set cursorline
set hlsearch
set linebreak
set nostartofline
set noswapfile
set secure
set shiftround
set shortmess+=I
set smartindent
set spelllang=en_gb
set splitbelow
set splitright
set switchbuf=useopen
set title
set ttyfast
set wildmode=list:longest

let g:netrw_liststyle = 3

augroup git_spell_check
    autocmd!
    autocmd FileType gitcommit setlocal spell
augroup END
