#!/bin/sh

ARGS="-H ldapi:/// -D cn=admin,dc=example,dc=com -w adminroot123"

# This config is sent to the ldap server after it has started.

ldapadd $ARGS -f /ldap/ldif/organizations.ldif
ldapadd $ARGS -f /ldap/ldif/users.ldif
ldapadd $ARGS -f /ldap/ldif/groups.ldif
