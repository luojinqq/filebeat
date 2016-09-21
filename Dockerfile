FROM alpine:3.3

ENV FILEBEAT_VERSION 1.3.1

RUN set -x; \
    apk add --no-cache --virtual build-deps go git make bash \
    && mkdir -p /go/src/github.com/elastic/beats \
    && export GOPATH=/go PATH=/go/bin:$PATH \
    && cd $GOPATH/src/github.com/elastic/beats \
    && git clone https://github.com/elastic/beats.git . \
    && git checkout -q v$FILEBEAT_VERSION \
    && cd filebeat/ && make \
    && mv filebeat /usr/local/bin \
    && apk del build-deps \
    && rm -rf /go
