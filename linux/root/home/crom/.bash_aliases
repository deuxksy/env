alias ls='ls --color=auto'
alias ll='lsd -alhF --group-directories-first'
alias grep='grep --color=auto'
alias vi='/opt/homebrew/Cellar/vim/9.0.0200/bin/vi'
alias kubectl='minikube kubectl --'

export TIME_STYLE='long-iso'
export EDITOR='vi'
export PATH="/opt/homebrew/bin:${PATH}"
#export DOCKER_HOST='unix:///Users/crong/.local/share/containers/podman/machine/podman-machine-default/podman.sock'

DEBUG() {
  printf "\r\033[0;34m[DEBUG] $(date +"%Y-%m-%d %T")\033[1m $1 \033[0m\n"
}

INFO() {
  printf "\r\033[0;32m[INFO ] $(date +"%Y-%m-%d %T")\033[1m $1 \033[0m\n"
}

WARN() {
  printf "\r\033[0;33m[WARN ] $(date +"%Y-%m-%d %T")\033[1m $1 \033[0m\n"
}

ERROR() {
  printf "\r\033[0;31m[ERROR] $(date +"%Y-%m-%d %T")\033[1m $1 \033[0m\n"
}

command_exits() {
  command -v "$@" >/dev/null 2>&1
}

check_command() {
  for cli in $@; do
    DEBUG "CLI: ${cli}"
    if ! command_exits ${cli}; then
      ERROR "${cli} is not installed."
      sleep 1
      exit 127
    fi
  done
}

awsh() {
  check_command aws yq &&
    aws ssm start-session \
      --target $(
        aws ec2 describe-instances \
          --filters Name=tag:Name,Values="$1" --output yaml | yq \
          ".Reservations[0].Instances[0].InstanceId"
      )
}
