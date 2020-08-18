#
# ~/.bash_profile
#

# if running bash
[[ -f ~/.bashrc ]] && . ~/.bashrc

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PATH

MAILPATH=~/Maildir/procmail.log
export MAILPATH

