#Download base image ubuntu 16.04
FROM ubuntu:16.04

# Add a new user "trainee"
RUN useradd -m trainee -s /bin/bash && \
    echo "trainee:linux_bash" | chpasswd

# Update Ubuntu Software repository
RUN apt-get update && \
    apt-get upgrade --yes

# Install ttyd
RUN mkdir /usr/bin/ttyd && \
    apt-get install -y wget git ssh nano sudo nmap man tmux && \
    usermod -aG sudo trainee && \
    wget --directory-prefix=/usr/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.6.0/ttyd_linux.x86_64 && \
    chmod +x /usr/bin/ttyd/ttyd_linux.x86_64

# Copy exercices into the image
COPY bash_exercices /home/trainee/

# Change to non-root privilege
USER trainee
WORKDIR /home/trainee

EXPOSE 1994
ENTRYPOINT ["/usr/bin/ttyd/ttyd_linux.x86_64", "-p", "1994", "-c", "linux_bash:linux_bash", "bash"]
