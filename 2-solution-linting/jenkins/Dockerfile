FROM jenkins/jenkins:lts

LABEL authors="Ferdinand Eckhard <ferdinand.eckhard@x-cellent.com>, Sandro Koll <sandro.koll@x-cellent.com>"

USER root

RUN echo "deb http://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list \
 && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    apt-transport-https=1.4.9 \
    docker-engine=17.05.0~ce-0~debian-jessie \
    sudo=1.8.19p1-2.1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
 && curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose

USER jenkins

COPY plugins.txt /usr/share/jenkins/plugins.txt

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
