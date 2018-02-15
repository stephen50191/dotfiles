# .bashrc

# Source global definitions
if [ -f ~/.homedir ]; then
  ~/.homedir
fi

#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

if [ -f /bin/zsh ]; then
  /bin/zsh
  exit
fi



# User specific aliases and functions
source ~/.aliases
