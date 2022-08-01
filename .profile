#
# ~/.bash_profile
#

if test -n "BASH_VERSION"; then
    #include .bashrc if it exists
    if test -f "$HOME/.bashrc"; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PATH

MAILPATH=~/Maildir/procmail.log
export MAILPATH

