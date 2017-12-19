FROM openjdk:8-jre-alpine

MAINTAINER jberrenberg v4.8.1

RUN apk --update --no-cache add tar wget && \
  adduser davmail -D && \
  mkdir /usr/local/davmail && \
  wget -qO - https://downloads.sourceforge.net/project/davmail/davmail/4.8.1/davmail-linux-x86_64-4.8.1-2507.tgz | tar -C /usr/local/davmail --strip-components=1 -xz && \
  mkdir /var/log/davmail && \
  chown davmail:davmail /var/log/davmail -R && \
  apk del tar wget

VOLUME        /etc/davmail

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail

USER davmail

CMD ["/usr/local/davmail/davmail.sh", "/etc/davmail/davmail.properties"]
