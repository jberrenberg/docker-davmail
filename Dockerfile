FROM alpine:latest

MAINTAINER jberrenberg v0.6

RUN apk --update --no-cache add openjdk7-jre tar && \
  adduser davmail -D && \
  mkdir /usr/local/davmail && \
  wget -qO - http://downloads.sourceforge.net/project/davmail/davmail/4.7.2/davmail-linux-x86_64-4.7.2-2427.tgz | tar -C /usr/local/davmail --strip-components=1 -xz && \
  mkdir /var/log/davmail && \
  chown davmail:davmail /var/log/davmail -R && \
  apk del tar

VOLUME        /etc/davmail

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail

USER davmail

CMD ["/usr/local/davmail/davmail.sh", "/etc/davmail/davmail.properties"]
