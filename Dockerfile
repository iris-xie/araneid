FROM golang:1.25.3-trixie

ENV GOARCH=amd64

ENV GOOS=linux

ENV CC=gcc

ENV CXX=g++

ENV GOOS=linux

ENV CC=gcc
ENV PATH=$PATH:$GOPATH/bin

ENV https_proxy="http://185.46.212.91:10074"
ENV http_proxy="http://185.46.212.91:10074"
ENV HTTPS_PROXY="http://185.46.212.91:10074"
ENV HTTP_PROXY="http://185.46.212.91:10074"


ADD build.sh /usr/local/bin

RUN mkdir -p /data/araneid

WORKDIR /data/araneid

COPY ./ /data/araneid/

RUN chmod +x /usr/local/bin/build.sh && apt update && apt install gcc g++ -y && apt autoclean && rm -rf /var/cache/apt

RUN cp zscaler.crt /usr/local/share/ca-certificates/

RUN update-ca-certificates

RUN go mod tidy
RUN go get -u github.com/beego/beego/v2@latest
RUN go get github.com/go-sql-driver/mysql@v1.8.1
RUN go install github.com/beego/bee@latest

CMD ["tail", "-f", "/dev/null"]

