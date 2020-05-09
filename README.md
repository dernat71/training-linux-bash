# Linux and Bash : Introduction training

This repository is intended to provide resources to generated playground environment for people following the training. The Dockerfil build an image relying on Ubuntu and exposing the terminal through a web-app named TTYD. A run script is also provided to spin up quickly 0 to N environments quickly.

To build the base Docker image, run the following command while at the repo's root :

```
sudo docker build -t ttyd_session .
```

One environment can be spin-up with the following `docker run` command :

```
sudo docker run -d -p {OUTSIDE_PORT}:1994 --hostname linux-bash-training ttyd_session
```

Few informations about the command above :
* The TTYD session is listening on port 1994 inside the container
* Using the `--hostname` flag allows to modify the __name of the computer__ simulated by Docker

You can use the `run_bash_envs.sh` script to run `N` docker-based environment starting at port `P` to `P+N`:
```
./run_bash_envs.sh -p P -n N
```

For TCP/IP services it's always better to run the services in the port range 32768 - 65535 (anonymous ports). So an example to deploy 30 environments between `33000 - 33030` would be :
```
./run_bash_envs.sh -p 33000 -n 30
```

Finally, to kill and remove all the containers, use the following command :
```
./kill_the_envs.sh
```
