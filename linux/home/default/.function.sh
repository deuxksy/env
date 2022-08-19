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
    DEBUG "${cli}: $(which ${cli})"
    if ! command_exits ${cli}; then
      ERROR "${cli} is not installed."
      sleep 1
      exit 127
    fi
  done
}

# awsh ${EC2-TAG-NAME}
# ec2ssh mf-prd-ec2-java
ec2ssh() {
  check_command aws yq &&
    aws ssm start-session \
      --target $(
        aws ec2 describe-instances \
          --filters Name=tag:Name,Values=$1 \
          --output yaml | yq \
          ".Reservations[0].Instances[0].InstanceId"
      )
}

# ecssh ${CLUSTER_NAME} ${SERVICE_NAME} ${CONTAINER_NAME}
# ecssh cluster-qa-backend service-qa-api api
ecssh() {
  check_command aws yq &&
    aws ecs execute-command --cluster $1 \
      --interactive \
      --command "/bin/sh" \
      --container $3 \
      --task $(
        aws ecs list-tasks \
          --cluster $1 \
          --service-name $2 \
          --desired-status RUNNING \
          --output yaml | yq \
          ".taskArns.[0]"
      )
}
