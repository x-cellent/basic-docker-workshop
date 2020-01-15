FROM jenkins/jenkins

USER root

RUN apt-get update
RUN apt install -y apt-transport-https gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"
RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io sudo
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` > docker-compose
RUN mv docker-compose /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

USER jenkins

COPY --chown=jenkins plugins.txt /usr/share/jenkins/plugins.txt

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
