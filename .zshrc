# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000000
setopt appendhistory autocd extendedglob notify
bindkey -e
export GOPATH=~/go
export PATH=i"$PATH:~/bin:$GOPATH/bin:$GOROOT/bin"
#source ~/bin/zsh-git-prompt/zshrc.sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/miltonsl/.zshrc'
autoload -Uz compinit
compinit
unset SSH_ASKPASS

# End of lines added by compinstall

#export TERM="xterm-256color"
export EDITOR=/usr/bin/vim
#source ~/.bin/tmuxinator.zsh

autoload -U colors
colors

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        tmux rename-window "$(echo $* | cut -d . -f 1)"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        command ssh "$@"
    fi
}

PROMPT="%{$fg[yellow]%}%!%{$reset_color%}:%{$fg[blue]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}:%{$fg[white]%}%2~%{$reset_color%}%{$fg[red]%} >%{$reset_color%} "

#setopt prompt_subst
#. ~/git-prompt.sh
export RPROMPT='$(git_super_status)'

alias ll="ls --color=auto -Flh"
alias ls="ls --color=auto"
alias commit="for file in *.pp;do if [ -f "$file" ]; then echo "$file";puppet-lint --no-only_variable_string-check "$file";fi;done;if [ $? = 0 ];then git commit --verbose -a;fi" 
alias dnf="sudo dnf"
alias sudos="sudo -s"
alias tmux="tmux -2"
alias tfp="terraform plan --var-file=development.tfvars"
alias tfa="terraform apply --var-file=development.tfvars"

bindkey '^R' history-incremental-pattern-search-backward

#Correct Key Bindings

#Solution 1
#
#bindkey "${terminfo[khome]}" beginning-of-line
#bindkey "${terminfo[kend]}" end-of-line
#bindkey "${terminfo[kdelete]}" delete
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line
bindkey "e[3~" delete-char

#Solution 2
#
#autoload zkbd
#[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
#source /home/miltonsl/.zkbd/xterm-256color-:0.0 
#source /home/miltonsl/.zkbd/xterm-:0.0
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




#Always at the end
cd ~
#source ~/bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
