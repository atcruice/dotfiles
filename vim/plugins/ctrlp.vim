Plug 'ctrlpvim/ctrlp.vim' | Plug 'jasoncodes/ctrlp-modified.vim' | Plug 'ivalkeen/vim-ctrlp-tjump'

let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 0 " Don't manage
let g:ctrlp_dotfiles = 0 " Ignore all dot/hidden files
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.hg$\|\.svn$\|backups$\|logs$\|tmp$\|_site$',
            \ 'file': '',
            \ 'link': '',
            \ }
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_match_window = 'bottom,order:ttb,min:10,max:10'

let g:ctrlp_tjump_only_silent = 1

if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

map <Leader>t :CtrlP<CR>
map <Leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>
map <Leader>l :CtrlPBuffer<CR>
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>
map <Leader>d :CtrlPCurFile<CR>
map <silent> <C-]> :CtrlPtjump<CR>
