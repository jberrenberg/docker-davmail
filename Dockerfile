FROM alpine:latest

MAINTAINER jberrenberg v0.8

RUN apk --update --no-cache add ca-certificates openjdk7-jre tar wget && \
  adduser davmail -D && \
  update-ca-certificates && \
  mkdir /usr/local/davmail && \
  wget -qO - http://downloads.sourceforge.net/project/davmail/davmail/4.7.3/davmail-linux-x86_64-4.7.3-2438.tgz | tar -C /usr/local/davmail --strip-components=1 -xz && \
  mkdir /var/log/davmail && \
  chown davmail:davmail /var/log/davmail -R && \
  apk del tar

# workaround for image ssl problems
RUN apk add --no-cache java-cacerts \
  && rm /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts \
  && ln -s /etc/ssl/certs/java/cacerts /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts

VOLUME        /etc/davmail

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail

USER davmail

CMD ["/usr/local/davmail/davmail.sh", "/etc/davmail/davmail.properties"]
