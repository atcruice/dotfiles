# vim: set ft=sh:

function output_warning
{
  echo -e "\033[1m\033[33mWarning:\033[0m $*"
}

if [[ -s ~/.bashrc ]]; then
  source ~/.bashrc
else
  output_warning '~/.bashrc not found'
fi

if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
  . "$(brew --prefix)"/etc/bash_completion
else
  output_warning 'bash-completion not found'
fi

eval "$(direnv hook $0)"
