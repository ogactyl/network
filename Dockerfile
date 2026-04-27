FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Basic packages install
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    sudo \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# code-server install
RUN curl -fsSL https://code-server.dev/install.sh | sh

# user create
RUN useradd -m coder
RUN echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER coder
WORKDIR /home/coder

# port expose
EXPOSE 7860

# start code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:7860", "--auth", "none"]
