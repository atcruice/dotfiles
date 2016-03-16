syntax enable
colorscheme jellybeans
highlight Search ctermbg=red ctermfg=white
set autoindent
set autoread
set autowriteall
set backspace=indent,eol,start
set cindent
set cursorline
set expandtab
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set linebreak
set mouse=a
set noequalalways
set nolist
set nostartofline
set noswapfile
set number
set ruler
set scrolloff=3
set shiftwidth=2
set shortmess+=I
set showcmd
set smartcase
set smarttab
set softtabstop=2
set spelllang=en_au
set switchbuf=useopen
set tabstop=2
set title
set ttyfast
set wildmenu
set wildmode=list:longest
set wrap
set writebackup

augroup c_headers
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
