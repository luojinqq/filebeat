FROM alpine
USER root
WORKDIR /etc/filebeat
RUN apk add --update curl &&\
    curl -L -O https://download.elastic.co/beats/packetbeat/filebeat-1.3.1_amd64.deb&&\
    dpkg -i filebeat-1.3.1_amd64.deb&&\
    rm -rf filebeat-1.3.1_amd64.deb
COPY filebeat.yml /etc/filebeat/
