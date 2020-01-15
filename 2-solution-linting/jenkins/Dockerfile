FROM jenkins/jenkins:lts

LABEL authors="Ferdinand Eckhard <ferdinand.eckhard@x-cellent.com>, Sandro Koll <sandro.koll@x-cellent.com>"

USER root

RUN apt-get update \
 && apt install -y --no-install-recommends \
    apt-transport-https=1.4.9 \
    gnupg2=2.1.18-8~deb9u4 \
    software-properties-common=0.96.20.2-1 \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    docker-ce=5:19.03.5~3-0~debian-stretch \
    docker-ce-cli=5:19.03.5~3-0~debian-stretch \
    containerd.io=1.2.10-3 \
    sudo=1.8.19p1-2.1+deb9u1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
 && curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose

USER jenkins

COPY --chown=jenkins plugins.txt /usr/share/jenkins/plugins.txt

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
