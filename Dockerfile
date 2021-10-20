FROM buildpack-deps:xenial-curl
RUN apt update && apt install build-essential git zip libpng16-dev autoconf libtool pkg-config nasm jq -y
RUN wget https://dl.google.com/go/go1.16.7.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.16.7.linux-amd64.tar.gz
RUN mkdir -p /go/src && mkdir -p /go/bin && mkdir -p /go/pkg
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs

ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:/go/bin
