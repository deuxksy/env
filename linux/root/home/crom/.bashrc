# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
PS1='[$(whoami)@$(hostname):$(pwd)]# '

CLASSPATH=$CLASSPATH:/home/stsports/batch/lib

alias vi='vim'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export PS1 CLASSPATH
