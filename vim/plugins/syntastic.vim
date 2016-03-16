Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = "*"
let g:syntastic_style_error_symbol = "*"
let g:syntastic_warning_symbol = "•"
let g:syntastic_style_warning_symbol = "•"

let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_args = "--rails"

let g:syntastic_c_compiler = 'gcc-4.4'
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_compiler_options = '-std=gnu89 -O -Wall -Wbad-function-cast -Wc++-compat -Wcast-qual -Wconversion -Wdeclaration-after-statement -Wextra -Wfatal-errors -Wfloat-equal -Wformat=2 -Winit-self -Winline -Winvalid-pch -Wmissing-declarations -Wmissing-include-dirs -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wunknown-pragmas -Wunsafe-loop-optimizations -Wwrite-strings -pedantic'

let g:syntastic_java_checkers = ['checkstyle', 'javac']
let g:syntastic_java_checkstyle_classpath = '/usr/local/Cellar/checkstyle/6.9/libexec/checkstyle-6.9-all.jar'
let g:syntastic_java_checkstyle_conf_file = '~/.google_checks.xml'
let g:syntastic_java_javac_config_file_enabled = 1

let g:syntastic_sh_shellcheck_args = '--shell=bash'
nmap <Leader>sc :SyntasticCheck<CR>
