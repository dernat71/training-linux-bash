sudo docker build -t ttyd_session .
sudo docker run -d -p {OUTSIDE_PORT}:1994 --hostname linux-bash-training ttyd_session