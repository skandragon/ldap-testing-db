#!/bin/sh

sh -x /ldap-setup.sh

slapd -4 -h "ldapi:/// ldap://0.0.0.0:$LDAPPORT" -d 0 &

wait_counter=0
while [ ! -f /run/openldap/slapd.pid ] ; do
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

# Monitor to make sure slapd is still running.  When the pid file is gone,
# we exit.  This is not perfect, and we should be doing a connection based
# probe.
while true ; do
  sleep 1
  [ ! -f /run/openldap/slapd.pid ] && exit 1
done

echo "Setup complete."
