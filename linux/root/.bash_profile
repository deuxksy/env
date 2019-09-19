# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export PS1="[\u@\h \w]\\$ "

set -o vi

alias ll="ls -alhF --color=auto --time-style +%y-%m-%d\ %H:%M"
alias brlog="tail -f /home/ec2-user/wisenut/sf1-br/log/isc/`date +%Y/%m/%Y%m%d`*log"
alias hflog="tail -f /home/ec2-user/wisenut/sf1-hf/log/isc/`date +%Y/%m/%Y%m%d`*log"
