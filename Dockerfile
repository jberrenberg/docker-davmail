FROM openjdk:8-jre-alpine

MAINTAINER jberrenberg v4.9.0

RUN apk --update --no-cache add wget && \
  adduser davmail -D && \
  mkdir /usr/local/davmail && \
  wget -qO /tmp/davmail.zip https://downloads.sourceforge.net/project/davmail/davmail/4.9.0/davmail-4.9.0-2652.zip && \
  unzip -q /tmp/davmail.zip -d /usr/local/davmail && \
  rm /tmp/davmail.zip && \
  mkdir /var/log/davmail && \
  chown davmail:davmail /var/log/davmail -R && \
  apk del wget

VOLUME        /etc/davmail

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail

USER davmail

CMD ["/usr/local/davmail/davmail.sh", "/etc/davmail/davmail.properties"]
