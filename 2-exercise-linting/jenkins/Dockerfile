FROM jenkins/jenkins

USER root

RUN echo "deb http://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list
RUN for server in \
        hkp://p80.pool.sks-keyservers.net:80 \
        hkp://keyserver.ubuntu.com:80 \
        ha.pool.sks-keyservers.net \
        keyserver.ubuntu.com \
        pgp.mit.edu; do \
     apt-key adv --keyserver $server --yes --always-trust --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && break || echo "Trying next keyserver"; done
RUN apt-get update
RUN apt-get install -y docker-engine apt-transport-https sudo
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` > docker-compose
RUN mv docker-compose /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

USER jenkins

COPY plugins.txt /usr/share/jenkins/plugins.txt

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
