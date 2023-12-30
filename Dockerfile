FROM buildpack-deps:focal-curl

RUN wget https://dl.google.com/go/go1.19.13.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.19.13.linux-amd64.tar.gz
RUN mkdir -p /go/src && mkdir -p /go/bin && mkdir -p /go/pkg

ENV NODE_MAJOR=16
RUN mkdir -p /etc/apt/keyrings \
&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
&& echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update && apt-get install nodejs build-essential git zip libpng-dev autoconf libtool pkg-config nasm jq -y \
&& apt-get clean
&& rm -rf /var/lib/apt/lists/*

ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:/go/bin
