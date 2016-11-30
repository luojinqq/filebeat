FROM alpine:3.3

ENV FILEBEAT_VERSION 5.0.1
ENV DOCKERIZE_VERSION v0.2.0
RUN set -x; \
    apk add --no-cache bash vim curl tar \
    && curl -O -L https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && curl -O -L https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz \
    && tar -C /usr/local/bin -xvf filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz \
    && mv filebeat-${FILEBEAT_VERSION}-linux-x86_64 filebeat \
