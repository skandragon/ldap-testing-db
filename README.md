# ldap-testing-db

This is a ldap server with a few pre-defined users set up.

## Administration

The root password for `cn=admin,dc=example,dc=com` is `adminroot123`

## Users

Each user is defined as:

|dn|password|
|-|-|
|uid=user1,ou=Users,dc=example,dc=com|user1password|
|uid=user2,ou=Users,dc=example,dc=com|user2password|
|uid=user3,ou=Users,dc=example,dc=com|user3password|
|uid=user4,ou=Users,dc=example,dc=com|user4password|
|uid=user5,ou=Users,dc=example,dc=com|user5password|

## Groups

These groups are defined:

|dn|name|members|
|-|-|-|
|cn=AllUsers,ou=Groups,dc=example,dc=com|AllUsers|user1, user2, user3, user4, user5|
|cn=OneTwo,ou=Groups,dc=example,dc=com|OneTwo|user1, user2|
|cn=Administrators,ou=Groups,dc=example,dc=com|Administrators|user2, user4|

Each user will see a `memberOf` attribute (which must be explicitly queried for)
in the user record.

## Durability of updates

There is no persistent store defined, nor do I plan on adding this.  This server
is for testing purposes, intended to be brought up and down as needed to run tests or demos.
