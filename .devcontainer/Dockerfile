# syntax=docker/dockerfile:1

FROM ubuntu:22.04
RUN apt-get update && apt-get install -y git curl nano vim xz-utils && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0 && echo "\n. $HOME/.asdf/asdf.sh\n" | tee -a ~/.bashrc ~/.profile
