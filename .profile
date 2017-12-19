# .bashrc

# Source global definitions
if [ -f ~/.homedir ]; then
  ~/.homedir
fi

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /bin/zsh ]; then
  /bin/zsh
  exit
fi



# User specific aliases and functions
export EDITOR=/usr/bin/vim

alias ll="ls --color=auto -Flh"
alias ls="ls --color=auto"
alias sudos="sudo -s"
