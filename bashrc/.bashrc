# ~/.bashrc
#

# If not running interactively, don't do anything
case $- in
    *i*) ;; # interactive
    *) return;;
esac

# ---------------------- environment variables ----------------------

#export TERM=xterm-kitty
#export TERM=xterm-256color
export HRULEWIDTH=73
export EDITOR=vim
export VISUAL=vim
export EDITOR_PREFIX=vim

export SCRIPTS=~/.local/bin/scripts
mkdir -p "$SCRIPTS" &>/dev/null
export SNIPPETS="$HOME/.local/share/snippets"
mkdir -p "$SNIPPETS" &>/dev/null

test -d ~/.vim/spell && export VIMSPELL=(~/.vim/spell/*.add)

# -----------------------------  pager ------------------------------
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

# if test -x /usr/bin/lesspipe; then
#     export LESSOPEN="| /usr/bin/lesspipe %s";
#     export LESSCLOSE="/usr/bin/lesspipe %s %s";
# fi
#
# export LESS_TERMCAP_mb="[35m" # magenta
# export LESS_TERMCAP_md="[33m" # yellow
# export LESS_TERMCAP_me="" # "0m"
# export LESS_TERMCAP_se="" # "0m"
# export LESS_TERMCAP_so="[34m" # blue
# export LESS_TERMCAP_ue="" # "0m"
# export LESS_TERMCAP_us="[4m" # underline

# ---------------------------- dircolors ----------------------------

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
    alias diff='diff --color'
fi

# -----------------------------  path -------------------------------
# We want to add dirs to the path and not replace the path
# The functions here will either append to the end of the path
# or prepend to the start of the path.
# They first check if the argument is already in the path and the
# they remove it and replace it either at the start or end as requested
#
# We use bash parater expansion extensively here
#

pathappend() {
  declare arg
  for arg in "$@"; do
    test -d "${arg}" || continue
    PATH=${PATH//:${arg}:/:} # Remove from the middle
    PATH=${PATH/#${arg}:/}   # Remove from the beginning
    PATH=${PATH/%:${arg}/}   # Remove from the end
    export PATH="${PATH:+"${PATH}:"}${arg}"
    done
}

pathprepend() {
  declare arg
  for arg in "$@"; do
    test -d "${arg}" || continue
    PATH=${PATH//:${arg}:/:}
    PATH=${PATH/#${arg}:/}
    PATH=${PATH/%:${arg}/}
    export PATH="${arg}${PATH:+":${PATH}"}"
    done
}

# remember that the last arg will be first in the path
pathprepend \
    ~/bin \
    ~/.local/bin \
    "$SCRIPTS"

pathappend \
    /usr/local/bin \
    /usr/bin \
    /usr/local/sbin \
    /var/lib/flatpak/exports/bin \
    /usr/lib/jvm/default/bin \
    /usr/bin/site_perl \
    /usr/bin/vendor_perl \
    /usr/bin/core_perl

# --------------------------------- cdpath ----------------------------------
# cd directly into anything in these directories without the full path

export CDPATH=.:\
~/repos/github:\
~/repos/github/$GITUSER:\
~/repos/dm4:\
~/repos:\
~

# --------------------------- bash shell options ----------------------------

# update the values of LINES and COLUMNS.
shopt -s checkwinsize
#shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob
#shopt -s nullglob # bug kills complet for some
#set -o noclobber

# -------------------------------- history ----------------------------------

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:ignorespace
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTTIMEFORMAT='%d/%m/%y %T '
# append to the history file, don't overwrite it
shopt -s histappend

# We will use vi editing of history
set -o vi

# -------------------------------  aliases ----------------------------------
# We have already defined the colour aliases in the colour section
# above

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Clear the screen
alias c='printf "\e[H\e[2J"'
# Use duck script to search the interweb
alias '?'=duck
# Make a temporary directory and cd into it
alias temp='cd $(mktemp -d)'

# Note regarding use of " and ' in expansions
# If we use " then the expansion happens *at that moment*
# If we use ' then the expandion happens when the alias is invoked
# When we use ' then the alias will use any new setting of SCRIPTS
alias scripts='cd $SCRIPTS'
alias snippets='cd $SNIPPETS'

# ------------------------------- functions ---------------------------------

gpg-reload() {
    pkill scdaemon
    pkill gpg-agent
    gpg-connect-agent /bye >/dev/null 2>&1
    gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
    gpgconf --reload gpg-agent
}

isosec() {
    date -u +%Y%m%d%H%M%S "$@"
} && export -f isosec

cdtemp() {
    name="$1"
    mkdir -p "/tmp/$name"
    cd "/tmp/$name"
}

# --------------------------- smart prompt ----------------------------------

PROMPT_LONG=50
PROMPT_MAX=95

__ps1() {
  local P='$'

  if test -n "${ZSH_VERSION}"; then
    local r='%F{red}'
    local g='%F{black}'
    local h='%F{blue}'
    local u='%F{yellow}'
    local p='%F{yellow}'
    local w='%F{magenta}'
    local b='%F{cyan}'
    local x='%f'
  else
    local r='\[\e[31m\]'
    local g='\[\e[30m\]'
    local h='\[\e[34m\]'
    local u='\[\e[33m\]'
    local p='\[\e[33m\]'
    local w='\[\e[35m\]'
    local b='\[\e[36m\]'
    local x='\[\e[0m\]'
  fi

  if test "${EUID}" == 0; then
    P='#'
    if test -n "${ZSH_VERSION}"; then
      u='$F{red}'
    else
      u=$r
    fi
    p=$u
  fi

  local dir;
  if test "$PWD" = "$HOME"; then
    dir='~'
  else
    dir="${PWD##*/}"
    if test "${dir}" = _; then
      dir=${PWD#*${PWD%/*/_}}
      dir=${dir#/}
    elif test "${dir}" = work; then
      dir=${PWD#*${PWD%/*/work}}
      dir=${dir#/}
    fi
  fi

  local B=$(git branch --show-current 2>/dev/null)
  test "$dir" = "$B" && B='.'
  local countme="$USER@$(hostname);$dir)$B)\$ "

  test "$B" = master -o "$B" = main && b=$r
  test -n "$B" && B="$g($b$B$g)"

  if test -n "${ZSH_VERSION}"; then
    local short="$u%n$g@$h%m$g:$w$dir$B$p$P$x "
    local long="$g╔ $u%n$g@%m\h$g:$w$dir$B\n$g╚ $p$P$x "
    local double="$g╔ $u%n$g@%m\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$x "
  else
    local short="$u\u$g@$h\h$g:$w$dir$B$p$P$x "
    local long="$g╔ $u\u$g@$h\h$g:$w$dir$B\n$g╚ $p$P$x "
    local double="$g╔ $u\u$g@$h\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$x "
  fi

  if test ${#countme} -gt "${PROMPT_MAX}"; then
    PS1="$double"
  elif test ${#countme} -gt "${PROMPT_LONG}"; then
    PS1="$long"
  else
    PS1="$short"
  fi
}

PROMPT_COMMAND="__ps1"

#PS1='\[$(tput setaf 82)\]\u@\h:\[$(tput setaf 12)\]\w \[$(tput setaf 82)\]\$ \[$(tput sgr0)\]'

# ------------------------------- GPG -------------------------------
GPG_TTY=`tty`
export GPG_TTY

# ------------------------------- FZF -------------------------------
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash


# ----------------------------- ranger   ----------------------------
export RANGER_LOAD_DEFAULT_RC=false

# ----------------------------- keyboard ----------------------------

# escape key mapping we do thin in .xinitrc or in the desktop for gnome
#test -n "$DISPLAY" && setxkbmap -option 'caps:escape' &>/dev/null

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh

umask 002
