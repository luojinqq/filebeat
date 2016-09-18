FROM alpine
USER root
WORKDIR /etc/filebeat
RUN apk add --update curl rpm -y &&\
    curl -L -O https://download.elastic.co/beats/filebeat/filebeat-1.3.1-x86_64.rpm&&\
    rpm -vi filebeat-1.3.1-x86_64.rpm&&\
    rm -rf filebeat-1.3.1-x86_64.rpm
COPY filebeat.yml /etc/filebeat/
