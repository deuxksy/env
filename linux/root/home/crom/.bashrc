# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias vi='vim'
alias ll='ls -alh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export VISUAL=vim
export EDITOR="$VISUAL"
