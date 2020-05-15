#!/bin/sh

sh /ldap-setup.sh

cd /
slapd -4 -h "ldap://0.0.0.0:$LDAPPORT" -d stats &

# Monitor to make sure slapd is still running.  When the pid file is gone,
# we exit.  This is not perfect, and we should be doing a connection based
# probe.
while true ; do
  sleep 1
  [ ! -f /run/openldap/slapd.pid ] && exit 1
done
