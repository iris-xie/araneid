FROM golang:1.25.3-trixie

ENV GOARCH=amd64

ENV GOOS=linux

ENV CC=gcc

ENV CXX=g++

ADD build.sh /usr/local/bin

RUN mkdir -p /data/

ENV GOPATH=/data

WORKDIR /data

COPY ./ /data/

RUN chmod +x /usr/local/bin/build.sh && apt update && apt install gcc g++ -y && apt autoclean && rm -rf /var/cache/apt

RUN cp zscaler.crt /usr/local/share/ca-certificates/

RUN update-ca-certificates

CMD ["tail", "-f", "/dev/null"]

