FROM alpine:3.12
MAINTAINER explorer@flame.org

ENV LDAPUSERID=1000
ENV LDAPPORT=3389

EXPOSE $LDAPPORT

RUN adduser --home /ldap --shell /bin/sh --disabled-password --no-create-home --gecos 'ldap user' --uid $LDAPUSERID ldap

RUN apk update \
  && apk add --no-cache openldap openldap-back-mdb openldap-overlay-memberof openldap-clients \
  && rm -rf /var/cache/apk/*

RUN mkdir /run/openldap /var/lib/openldap/run && chown ldap:ldap /run/openldap /var/lib/openldap/run

WORKDIR /ldap

RUN mkdir -p /ldap/rw/data && chmod -R a+rwX /ldap/rw

COPY ./ldap/ /ldap/

COPY ldap-setup.sh /ldap-setup.sh
COPY ldap-setup-postrun.sh /ldap-setup-postrun.sh

COPY entrypoint.sh /entrypoint.sh
COPY startslapd.sh /startslapd.sh
RUN chmod +x /*.sh

# This will have issues binding port, and some files need to be fixed up before this can be used.
USER $LDAPUSERID:$LDAPUSERID

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/sh", "/startslapd.sh"]
