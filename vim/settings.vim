set background=dark
colorscheme jellybeans
highlight Search ctermbg=DarkRed ctermfg=white

set autowriteall
set breakindent
set breakindentopt=shift:2
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

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

augroup indent_two
    autocmd!
    autocmd Filetype ruby,eruby,java,yaml,javascript,vue,liquid,scss,json setlocal tabstop=2 shiftwidth=2
augroup END

augroup ternconfig
    autocmd!
    autocmd BufRead,BufNewFile .tern-project set filetype=json
    autocmd BufRead,BufNewFile .tern-config set filetype=json
augroup END

augroup vue_syntax
    autocmd!
    autocmd Filetype vue syntax sync fromstart
augroup END

" Load all plugins now. Plugins need to be added to runtimepath before
" helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded. All messages
" and errors will be ignored.
silent! helptags ALL
