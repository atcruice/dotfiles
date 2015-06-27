Plugin 'airblade/vim-gitgutter'
let g:gitgutter_sign_column_always = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 0
nmap <Leader>ggn <Plug>GitGutterNextHunk
nmap <Leader>ggp <Plug>GitGutterPrevHunk
nmap <Leader>ggr <Plug>GitGutterRevertHunk
