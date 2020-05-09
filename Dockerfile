#Download base image ubuntu 16.04
FROM ubuntu:16.04

# Add a new user "accenture_trainee"
RUN useradd -m accenture_trainee -s /bin/bash && \
    echo -e "acn2020\nacn2020" | passwd accenture_trainee

# Update Ubuntu Software repository
RUN apt-get update && \
    apt-get upgrade --yes

# Install ttyd
RUN mkdir /usr/bin/ttyd && \
    apt-get install -y wget git ssh nano sudo nmap man tmux && \
    usermod -aG sudo accenture_trainee && \
    wget --directory-prefix=/usr/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.6.0/ttyd_linux.x86_64 && \
    chmod +x /usr/bin/ttyd/ttyd_linux.x86_64

# Change to non-root privilege
USER accenture_trainee
WORKDIR /home/accenture_trainee

EXPOSE 1994
ENTRYPOINT ["/usr/bin/ttyd/ttyd_linux.x86_64", "-p", "1994", "-c", "acn2020:acn2020", "bash"]