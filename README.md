# ldap-testing-db

This is a ldap server with a few pre-defined users set up.

## Administration

The root password for `cn=admin,dc=example,dc=com` is `adminroot123`

## Users

Each user is defined as:

`uid=user1,ou=Users,dc=example,dc=com`

For each of the five users, the passwords is `user1password` with 1 replaced for {1,2,3,4,5}.

## Groups

Three groups are defined:

AllUsers: all users are members.
OneTwo: user1 and user2 are members.
Administrators: user2 and user4 are members.
