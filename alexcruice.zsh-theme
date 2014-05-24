prompt_context() {
    local context=""
    local user=$(id -un)
    local host=$(hostname -s)

    if [[ "$user" != "alexc" ]]; then
        context+="$user"
    fi
    if [[ "$host" != "macbook" ]]; then
        context+="@$host"
    fi
    if [[ -n "$context" ]]; then
        context+=" "
    fi

    echo "$context"
}

local ret_status="%(?:%{$fg[green]%}:%{$fg[red]%})"
PROMPT=$'%{$fg[magenta]%}$(prompt_context)%{$fg[cyan]%}%~$(git_prompt_info)\n${ret_status}$%{$reset_color%} '
RPROMPT='%{$fg[red]%}$(rvm-prompt)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
