Plug 'mileszs/ack.vim'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>A :AckFromSearch!<CR>

if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
