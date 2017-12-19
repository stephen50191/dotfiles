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


#Correct Key Bindings
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# Bring in common parameters between bash and zsh
source ~/.aliases

#Always at the end
source ~/.bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
