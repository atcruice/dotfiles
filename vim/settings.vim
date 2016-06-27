syntax enable
set background=dark
colorscheme base16-eighties
highlight Search ctermbg=red ctermfg=white

set autoread
set autowriteall
set backspace=indent,eol,start
set breakindent
set breakindentopt=shift:2
set cursorline
set expandtab
set exrc
set hidden
set history=1000
set hlsearch
set ignorecase
set includeexpr=substitute(v:fname,'\\.','/','g')
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
set secure
set shiftround
set shiftwidth=4
set shortmess+=I
set showcmd
set smartcase
set smartindent
set smarttab
set spelllang=en_au
set switchbuf=useopen
set tabstop=4
set timeoutlen=1000 ttimeoutlen=0
set title
set ttyfast
set wildmenu
set wildmode=list:longest
set wrap
set writebackup

augroup indent_two
    autocmd!
    autocmd Filetype ruby,java,netlogo,yaml setlocal tabstop=2 shiftwidth=2
augroup END

augroup netlogo
    autocmd!
    autocmd BufRead,BufNewFile *.nlogo set filetype=netlogo
augroup END
