colorscheme jellybeans

highlight Search ctermbg=DarkRed ctermfg=white

set background=dark
set breakindent
set breakindentopt=shift:2
set cursorline
set expandtab
set hidden
set history=1000
set hlsearch
set ignorecase
set linebreak
set modeline
set mouse=a
set mousehide
set mousemodel=extend
set nocopyindent
set nomousefocus
set norelativenumber
set nostartofline
set noswapfile
set noundofile
set number
set secure
set shiftround
set shiftwidth=0
set shortmess+=I
set smartcase
set smartindent
set spelllang=en_gb
set splitbelow
set splitright
set switchbuf=useopen
set tabstop=2
set title
set ttyfast
set wildmode=list:longest

let g:netrw_liststyle = 3

augroup git_spell_check
    autocmd!
    autocmd FileType gitcommit setlocal spell
augroup END
