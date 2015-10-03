# DavMail for Docker

[Davmail Gateway](http://davmail.sourceforge.net/) in a Docker container

## Quickstart

You need a `davmail.properties` configuration. If you don't know how click [here](http://davmail.sourceforge.net/serversetup.html).

Run the container:

``` bash
DAVMAIL_CONF=<absolute/path/to/davmail.properties>
docker run -v $(DAVMAIL_CONF):/etc/davmail/davmai.properties -p 1080:1080 jberrenberg/davmail
```

## Exposed ports

The following ports are exposed by the container:

* caldav: 1080
* imap: 1143
* ldap: 1389
* pop: 1110
* smtp: 1025
