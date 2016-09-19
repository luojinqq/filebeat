FROM centos:7
USER root
WORKDIR /etc/filebeat
ENV DOCKERIZE_VERSION v0.2.0
RUN yum install wget -y&&\
    wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz&&\
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz&&\
    curl -L -O https://download.elastic.co/beats/filebeat/filebeat-1.3.1-x86_64.rpm&&\
    rpm -vi filebeat-1.3.1-x86_64.rpm&&\
    rm -rf filebeat-1.3.1-x86_64.rpm&&\
    rm -rf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
