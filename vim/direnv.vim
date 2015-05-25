if exists("$EXTRA_VIM")
  for path in split($EXTRA_VIM, ':')
    exec "source ".path
  endfor
endif

if has("autocmd")
  autocmd BufRead,BufNewFile .envrc set filetype=sh
endif
