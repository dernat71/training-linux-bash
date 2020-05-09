#!/bin/bash
while getopts ":n:p:" opt; do
  case ${opt} in
    n )
      N_ENVS=$OPTARG
      ;;
    p )
      START_PORT=$OPTARG
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))

for ((i=START_PORT; i<START_PORT+N_ENVS+1; i++)); do
	sudo docker run -d -p $i:1994 --hostname linux-bash-training ttyd_session
done
