#!/bin/sh

# This is a hack, but convert the config from .conf to remotely configurable
# each run.

[ -d /ldap/rw/data ] || mkdir /ldap/rw/data
cp -r /ldap/DB_CONFIG /ldap/rw/data/DB_CONFIG

[ -d /ldap/rw/slapd.d ] || mkdir /ldap/rw/slapd.d
cp /ldap/slapd.conf /ldap/rw/slapd.conf
slaptest -f /ldap/rw/slapd.conf -F /ldap/rw/slapd.d
