# My Zsh config.  Stolen and built my many different people.  If I didn't give you credit please let me know.
#
#
#


# Set history file
if [[ `whoami` != "root" ]];then
  HISTFILE=~/.histfile
else
  HISTFILE=/root/.histfile
fi

# Set history size
HISTSIZE=10000
SAVEHIST=1000000

# zsh options
#
# INC_APPEND_HISTORY
# New history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits.
#
# AUTO_CD
# If a command is issued that can't be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
#
# EXTENDED_GLOB
# Treat the '#', '~' and '^' characters as part of patterns for filename generation, etc. (An initial unquoted '~' always produces named directory expansion.)
#
# NOTIFY
# Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt inc_append_history auto_cd extended_glob notify

# Set up auto completion
autoload -Uz compinit
compinit

# Allow colors in prompt
autoload -U colors
colors


function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

#Adding git status to right side.
if [[ -z ~/.bin/zsh-git-prompt/zshrc.sh ]];then
  source ~/.bin/zsh-git-prompt/zshrc.sh
  export RPROMPT='$(git_super_status)'
fi

# Prompts
export PROMPT="%{$fg[yellow]%}%!%{$reset_color%}:%{$fg[blue]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}:%{$fg[white]%}%2~%{$reset_color%}%{$fg[red]%}>%{$reset_color%} "

bindkey '^R' history-incremental-pattern-search-backward

#Set vim Key bindings.
#bindkey -v

# Setting window title
#precmd () {print -Pn "\e]0;%n@%m"}
#case $TERM in
#    xterm*)
#        precmd () {print -Pn "\e]0;%n@%m\a"}
#        ;;
#esac

#Correct Key Bindings
#[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
#[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
#[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
#[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
#[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
#[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
#[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
#[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
#[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
#[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
#[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix





# Bring in common parameters between bash and zsh
source ~/.aliases

#Always at the end
#source ~/.bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
