# Ubuntu 18.04
FROM ubuntu:bionic-20190122

# Install system depedencies (explicitly versioned)
RUN \
    apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    vim-nox=2:8.0.1453-1ubuntu1 \
    tmux=2.6-3ubuntu0.1 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create the user
RUN useradd -ms /bin/bash student
USER student
WORKDIR /home/student
