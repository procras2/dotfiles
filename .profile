#
# ~/.bash_profile
#

# Issue the fortune

if test -f /usr/bin/forture; then
  /usr/bin/fortune
fi

if test -n "BASH_VERSION"; then
    #include .bashrc if it exists
    if test -f "$HOME/.bashrc"; then
        . "$HOME/.bashrc"
    fi
fi

#MAILPATH=~/Maildir/procmail.log
#export MAILPATH

