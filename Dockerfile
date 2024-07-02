FROM ubuntu:24.04
LABEL maintainer="docker-asdf@sgerrand.dev"

RUN apt-get update -qq \
  && apt-get install -qqy \
    autoconf \
    automake \
    ca-certificates \
    curl \
    git \
    libffi-dev \
    libncurses-dev \
    libreadline-dev \
    libssl-dev \
    libtool \
    libxslt-dev \
    libyaml-dev \
    unixodbc-dev \
    unzip \
	--no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /asdf

RUN git clone https://github.com/asdf-vm/asdf.git /asdf/.asdf \
  && cd /asdf/.asdf \
  && git checkout "$(git describe --abbrev=0 --tags)"
