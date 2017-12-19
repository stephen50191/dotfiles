# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /bin/zsh ]; then
  /bin/zsh
  exit
fi



# User specific aliases and functions
export EDITOR=/usr/bin/vim
PROMPT="%{$fg[yellow]%}%!%{$reset_color%}:%{$fg[blue]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}:%{$fg[white]%}%2~%{$reset_color%}%{$fg[red]%} >%{$reset_color%} "

alias ll="ls --color=auto -Flh"
alias ls="ls --color=auto"

alias sudos="sudo -s"
