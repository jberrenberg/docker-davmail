FROM openjdk:8-jre-alpine

MAINTAINER jberrenberg v5.5.1

ADD https://downloads.sourceforge.net/project/davmail/davmail/5.5.1/davmail-5.5.1-3299.zip /tmp/davmail.zip

RUN adduser davmail -D && \
  mkdir /usr/local/davmail && \
  unzip -q /tmp/davmail.zip -d /usr/local/davmail && \
  rm /tmp/davmail.zip

VOLUME        /etc/davmail
VOLUME        /var/log/davmail

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail

USER davmail

CMD ["/usr/local/davmail/davmail", "/etc/davmail/davmail.properties"]
