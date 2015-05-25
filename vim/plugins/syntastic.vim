Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = "*"
let g:syntastic_style_error_symbol = "*"
let g:syntastic_warning_symbol = "•"
let g:syntastic_style_warning_symbol = "•"
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_args = "--rails"
let g:syntastic_mode_map = { "mode": "active", "passive_filetypes": ["ruby"] }
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_compiler_options = '-std=c11 -Wall -Wextra -Wwrite-strings -pedantic'
let g:syntastic_sh_shellcheck_args = '--shell=bash'
nmap <Leader>sc :SyntasticCheck<CR>
