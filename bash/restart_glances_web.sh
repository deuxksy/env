#!/usr/bin/env bash
PID=`ps -eaf | grep '/usr/local/bin/glances -w' | grep -v grep | awk '{print $2}'`
if [[ "" !=  "${PID}" ]]; then
  echo "glances kill ${PID} && kill -9 ${PID}"
  kill ${PID} && kill -9 ${PID}
fi

nohup glances -w &
