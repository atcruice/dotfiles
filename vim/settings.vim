set background=dark
colorscheme jellybeans
highlight Search ctermbg=DarkRed ctermfg=white

set autowriteall
set breakindent
set breakindentopt=shift:2
set cursorcolumn
set cursorline
set expandtab
set exrc
set hidden
set hlsearch
set ignorecase
set includeexpr=substitute(v:fname,'\\.','/','g')
set linebreak
set mouse=a
set nocompatible
set noequalalways
set nolist
set nostartofline
set noswapfile
set number
set secure
set shiftround
set shiftwidth=4
set shortmess+=I
set showcmd
set smartcase
set smartindent
set spelllang=en_au
set splitbelow
set splitright
set switchbuf=useopen
set tabstop=4
set title
set ttyfast
set wildmode=list:longest
set wrap
set writebackup

augroup indent_two
    autocmd!
    autocmd Filetype ruby,eruby,java,netlogo,yaml,javascript,vue,liquid,scss setlocal tabstop=2 shiftwidth=2
augroup END

augroup netlogo
    autocmd!
    autocmd BufRead,BufNewFile *.nlogo set filetype=netlogo
augroup END

augroup ternconfig
    autocmd!
    autocmd BufRead,BufNewFile .tern-project set filetype=json
    autocmd BufRead,BufNewFile .tern-config set filetype=json
augroup END
