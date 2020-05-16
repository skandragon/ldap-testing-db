#!/bin/sh

# This is a hack, but convert the config from .conf to remotely configurable
# each run.

slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d
rm /etc/openldap/slapd.conf
touch /etc/openldap/slapd.conf
