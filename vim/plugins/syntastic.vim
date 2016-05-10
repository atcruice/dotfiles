Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "*"
let g:syntastic_style_error_symbol = "*"
let g:syntastic_warning_symbol = "•"
let g:syntastic_style_warning_symbol = "•"

let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_args = "--rails"

let g:syntastic_c_compiler = 'gcc-4.8'
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_compiler_options = '-std=gnu99 -O2 -Waggregate-return -Wall -Wbad-function-cast -Wcast-align -Wcast-qual -Wconversion -Wdisabled-optimization -Wdouble-promotion -Wextra -Wfatal-errors -Wfloat-equal -Wformat=2 -Winit-self -Winline -Winvalid-pch -Wjump-misses-init -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Woverlength-strings -Wpacked -Wpointer-arith -Wredundant-decls -Wshadow -Wstack-protector -Wstrict-overflow=5 -Wstrict-prototypes -Wsuggest-attribute=const -Wsuggest-attribute=format -Wsuggest-attribute=noreturn -Wsuggest-attribute=pure -Wswitch-default -Wsync-nand -Wtraditional-conversion -Wtrampolines -Wundef -Wunsafe-loop-optimizations -Wvector-operation-performance -Wwrite-strings'
let g:syntastic_c_include_dirs = ['/opt/X11/include']

let g:syntastic_java_checkers = ['checkstyle', 'javac']
let g:syntastic_java_checkstyle_classpath = '/usr/local/Cellar/checkstyle/6.9/libexec/checkstyle-6.9-all.jar'
let g:syntastic_java_checkstyle_conf_file = '~/.google_checks.xml'
let g:syntastic_java_javac_config_file_enabled = 1

let g:syntastic_sh_shellcheck_args = '--shell=bash'
nmap <Leader>sc :SyntasticCheck<CR>
