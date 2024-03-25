FROM buildpack-deps:focal-curl

RUN apt-get update && apt-get install gnupg -y
RUN wget https://dl.google.com/go/go1.20.7.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.20.7.linux-amd64.tar.gz
RUN mkdir -p /go/src && mkdir -p /go/bin && mkdir -p /go/pkg

ENV NODE_MAJOR=18
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_MAJOR}.x | bash -
RUN apt-get install nodejs build-essential git zip libpng-dev autoconf libtool pkg-config nasm jq -y \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:/go/bin
