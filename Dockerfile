# Ubuntu 18.04
FROM ubuntu:bionic-20190122

# Make the shell environment support nice stuff
ENV TERM=xterm-256color

# Do not exclude man pages & other documentation
RUN rm /etc/dpkg/dpkg.cfg.d/excludes


# Install desired system depedencies (explicitly versioned)
RUN \
    apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    vim-nox=2:8.0.1453-1ubuntu1 \
    tmux=2.6-3ubuntu0.1 \
    man-db=2.8.3-2ubuntu0.1 \
    htop=2.1.0-3 \
    less=487-0.1 \
    manpages-dev=4.15-1 \
    manpages-posix-dev=2013a-2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create the user
RUN useradd -ms /bin/bash student
USER student
WORKDIR /home/student
