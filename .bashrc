#
# ~/.bashrc
#

# We will use vi editing of command line
set -o vi

# If not running interactively, don't do anything
case $- in
    *i*) ;; # interactive
    *) return;;
esac

# envioronment variables
export TERM=xterm-256color

export HRULEWIDTH=73
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi

test -d ~/.vim/spell && export VIMSPELL=(~/.vim/spell/*.add)

# escape key mapping
#test -n "$DISPLAY" && setxkbmap -option 'caps:escape' &>/dev/null
# pager

if test -x /usr/bin/lesspipe; then
    export LESSOPEN="| /usr/bin/lesspipe %s";
    export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me="" # "0m"
export LESS_TERMCAP_se="" # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue="" # "0m"
export LESS_TERMCAP_us="[4m" # underline

# dircolors

if command -v /usr/bin/dircolors &>/dev/null; then
    if test -r ~/.dircolors; then
        eval $(dircolors -b ~/.dircolors)
    else
        eval $(dircolors -b)
    fi

    alias ls='ls -h --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# history

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:ignorespace
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTTIMEFORMAT='%d/%m/%y %T '
# append to the history file, don't overwrite it
shopt -s histappend

# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# aliases
alias c='printf "\e[H\e[2J"'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

PS1='\[$(tput setaf 82)\]\u@\h:\[$(tput setaf 12)\]\w \[$(tput setaf 82)\]\$ \[$(tput sgr0)\]'

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

#export PATH=/home/adrian/bin:$PATH

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh

umask 002
