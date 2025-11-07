FROM golang:1.25.3-trixie

ENV GOARCH=amd64

ENV GOOS=linux

ENV CC=gcc

ENV CXX=g++

ADD build.sh /usr/local/bin

RUN mkdir -p /data

WORKDIR /data

COPY ./ /data/

RUN chmod +x /usr/local/bin/build.sh && apt update && apt install gcc g++ -y && apt autoclean && rm -rf /var/cache/apt

RUN cp zscaler.crt /usr/local/share/ca-certificates/

RUN update-ca-certificates

RUN go get github.com/beego/beego/v2@latest && go mod tidy

CMD ["tail", "-f", "/dev/null"]

