scriptencoding utf-8
set encoding=utf-8

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible " be iMproved, required
filetype off " required
let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin 'EasyMotion'
" Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'bufexplorer.zip'
" Plugin 'bufkill.vim'
" Plugin 'jlanzarotta/bufexplorer'
" Plugin 'jpo/vim-railscasts-theme'
" Plugin 'tomasr/molokai'
" Plugin 'upAndDown'
" Plugin 'vividchalk.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'chreekat/vim-paren-crosshairs'
Plugin 'digitaltoad/vim-jade'
Plugin 'ervandew/supertab'
Plugin 'itchyny/lightline.vim'
Plugin 'jasoncodes/ctrlp-modified.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pivotal/tmux-config'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'wincent/Command-T'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

set noshowmode
set laststatus=2

let g:surround_35   = "#{\r}" " #
let g:surround_40   = "(\r)"  " (
let g:surround_41   = "(\r)"  " )
let g:surround_123  = "{\r}"  " {
let g:surround_125  = "{\r}"  " }
let g:surround_91   = "[\r]"  " [
let g:surround_93   = "[\r]"  " ]

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = "*"
let g:syntastic_style_error_symbol = "*"
let g:syntastic_warning_symbol = "•"
let g:syntastic_style_warning_symbol = "•"
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_ruby_rubocop_args = "--rails"
" hi SignColumn ctermbg=232

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax enable
  set background=dark
  colorscheme jellybeans
  set hlsearch
endif

let g:indent_guides_enable_on_vim_startup = 1

" NERDTree
noremap <Leader>. :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeFind<CR>

let g:loaded_netrw = 1            " Disable netrw
let g:loaded_netrwPlugin = 1      " Disable netrw
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowLineNumbers = 0 " Disable line numbers
let g:NERDTreeMinimalUI = 1       " Disable help message
let g:NERDTreeDirArrows = 1       " Enable directory arrows
let g:NERDTreeWinPos = 'right'

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set noswapfile
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set wrap
set cursorline
set ignorecase
set smartcase
set ttyfast
set autoread
set hidden
set scrolloff=2
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18
hi Search ctermbg=red ctermfg=white
nnoremap <Leader>/ :nohlsearch<CR><C-L>
nmap <Leader>r dwi
" Close quickfix window
map <Leader>k :ccl<CR>
" Yank and put system pasteboard with <Leader>y/p
noremap <Leader>y "*y
nnoremap <Leader>yy "*yy
noremap <Leader>p "*p
noremap <Leader>P "*P
" Select all
map <Leader>a ggVG
" Highlight word at cursor without changing position
nnoremap <Leader>h *<C-O>
" Jump to start and end of line using the home row keys
noremap H ^
noremap L $
"Insert binding.pry on the current line
map <Leader>bi Obinding.pry<Esc>
" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Movement & wrapped long lines
" This solves the problem that pressing down jumps your cursor 'over' the current line to the next line
nnoremap j gj
nnoremap k gk
" ack
nnoremap <Leader>H *<C-O>:AckFromSearch!<CR>
nmap <Leader>f :Ack!<Space>
nmap <Leader>F :AckFromSearch!<CR>
" ctrlp-modified
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>
