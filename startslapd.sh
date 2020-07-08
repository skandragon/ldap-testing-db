#!/bin/sh

sh /ldap-setup.sh

slapd -4 -h "ldapi://%2fldap%2frw%2fsocket/ ldap://0.0.0.0:$LDAPPORT" -d 0 -f /ldap/rw/slapd.conf -F /ldap/rw/slapd.d &

wait_counter=0
while [ ! -f /ldap/rw/slapd.pid ] ; do
  sleep 1
  wait_counter=`expr $wait_counter + 1`
  echo "Waiting for openldap to start ($wait_counter)..."
  if [ "$wait_counter" = 30 ] ; then
    echo "Could not start openldap in 30 seconds, terminating container"
    exit 1
  fi
done
echo "Started openldap"

sh /ldap-setup-postrun.sh

echo "Container running."

# Monitor to make sure slapd is still running.  When the pid file is gone,
# we exit.  This is not perfect, and we should be doing a connection based
# probe.
while true ; do
  sleep 1
  [ ! -f /ldap/rw/slapd.pid ] && exit 1
done

echo "Setup complete."
