FROM alpine
USER root
WORKDIR /etc/filebeat
RUN apk add --no-cache curl dpkg&&\
    curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.3.1_amd64.deb&&\
    dpkg -i filebeat_1.3.1_amd64.deb&&\
    rm -rf filebeat_1.3.1_amd64.deb
COPY filebeat.yml /etc/filebeat/
