#!/usr/bin/env bash
pkill -f "glances -w"


nohup glances -w &
