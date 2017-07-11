FROM buildpack-deps:jessie-curl
RUN cat /etc/hosts
#RUN sed -e '/127.0.0.1/s/$/ dockerhost/' -i /etc/hosts
RUN echo '127.0.0.1 dockerhost localhost' >> /etc/hosts
RUN apt-get update && apt-get install build-essential git -y
RUN wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.8.linux-amd64.tar.gz
RUN mkdir /go
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn -y

ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:/go/bin

