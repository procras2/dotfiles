#
# ~/.profile
#

if test -n "BASH_VERSION"; then
    #include .bashrc if it exists when running bash
    if test -f "$HOME/.bashrc"; then
        . "$HOME/.bashrc"
    fi
fi

#MAILPATH=~/Maildir/procmail.log
#export MAILPATH

if uwsm check may-start && uwsm select; then
  exec systemd-cat -t uwsm_start uwsm start default
fi
