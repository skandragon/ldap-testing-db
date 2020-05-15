FROM alpine:3.11
MAINTAINER explorer@flame.org

ENV LDAPUSERID=1000
ENV LDAPPORT=389

EXPOSE $LDAPPORT

RUN adduser --home /ldap --shell /bin/sh --disabled-password --no-create-home --gecos 'ldap user' --uid $LDAPUSERID ldap

RUN apk update \
  && apk add --no-cache openldap openldap-back-mdb openldap-overlay-memberof openldap-clients \
  && rm -rf /var/cache/apk/*

run mkdir /run/openldap && chown ldap:ldap /run/openldap

WORKDIR /ldap

COPY ./ldap/ /ldap/
RUN cp /etc/openldap/DB_CONFIG.example /var/lib/openldap/openldap-data/DB_CONFIG && chmod +r /var/lib/openldap/openldap-data/DB_CONFIG
RUN cp /ldap/slapd.conf /etc/openldap/slapd.conf
RUN cp -r /ldap/slapd.d/ /etc/openldap/slapd.d/ && chown ldap:ldap /etc/openldap/slapd.d

# ldap-setup.sh contains all the initial magic to set up sample groups and users.
COPY ldap-setup.sh /ldap-setup.sh
#RUN /bin/sh /ldap-setup.sh

COPY entrypoint.sh /entrypoint.sh
COPY startslapd.sh /startslapd.sh
RUN chmod +x /entrypoint.sh /startslapd.sh

# This will have issues binding port, and some files need to be fixed up before this can be used.
# USER $LDAPUSERID:$LDAPUSERID

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/sh", "/startslapd.sh"]
#CMD ["/bin/sh", "-c", "ps"]
