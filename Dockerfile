FROM debian:jessie
MAINTAINER jberrenberg v0.1

RUN DEBIAN_FRONTEND=noninteractive ;\
  apt-get update && apt-get install -y \
  default-jre \
  wget && \
  apt-get clean && \
  rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/*

RUN groupadd -r davmail && \
  useradd -r -g davmail davmail

RUN mkdir /usr/local/davmail && \
  wget -qO - http://downloads.sourceforge.net/project/davmail/davmail/4.6.1/davmail-linux-x86_64-4.6.1-2343.tgz | tar -C /usr/local/davmail --strip-components=1 -xvz && \
  mkdir /var/log/davmail && \
  chown davmail:davmail /var/log/davmail -R

COPY docker.sh /usr/local/davmail/

VOLUME        /etc/davmail

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail

USER davmail
ENTRYPOINT    ["/usr/local/davmail/davmail.sh"]
