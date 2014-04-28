local ret_status="%(?:%{$fg[green]%}:%{$fg[red]%})"
PROMPT='%{$fg[green]%}%p %{$fg[cyan]%}%~$(git_prompt_info) ${ret_status}$ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
