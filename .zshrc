# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000000
setopt appendhistory autocd extendedglob notify
bindkey -e
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
zstyle :compinstall filename '/home/miltonsl/.zshrc'
autoload -Uz compinit
compinit

autoload -U colors
colors

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

# ZSH only configs
PROMPT="%{$fg[yellow]%}%!%{$reset_color%}:%{$fg[blue]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}:%{$fg[white]%}%2~%{$reset_color%}%{$fg[red]%} >%{$reset_color%} "
export RPROMPT='$(git_super_status)'
source ~/.bin/zsh-git-prompt/zshrc.sh
bindkey '^R' history-incremental-pattern-search-backward
bindkey -m


#Correct Key Bindings
[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
source ~/.zkbd/$TERM-$VENDOR-$OSTYPE

# Bring in common parameters between bash and zsh
source ~/.aliases

#Always at the end
#source ~/bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
