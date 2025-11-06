FROM golang:1.25.3-trixie

ENV GOARCH=amd64

ENV GOOS=linux

ENV CC=gcc

ENV CXX=g++

ADD build.sh /usr/local/bin

COPY ./ ./

RUN chmod +x /usr/local/bin/build.sh && apt update && apt install gcc g++ -y && apt autoclean && rm -rf /var/cache/apt

CMD ["tail", "-f", "/dev/null"]

