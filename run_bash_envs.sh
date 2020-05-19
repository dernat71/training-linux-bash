#!/bin/bash
read -p "What's the port start range ? : " start_port
read -p "What's the number of environment to deploy ? : " n_envs

for ((i=start_port; i<start_port+n_envs; i++)); do
	sudo docker run -d -p $i:1994 --hostname linux-bash-training ttyd_session
done
