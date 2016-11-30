FROM alpine:3.3

ENV FILEBEAT_VERSION 5.0.1

RUN set -x; \
    apk add --no-cache bash vim curl tar \
    && curl -O -L https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz \
    && ls \
    && tar -xvf filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz \
    && mv filebeat-${FILEBEAT_VERSION}-linux-x86_64 filebeat \
    && cd filebeat/ \
    && mv filebeat /usr/local/bin
