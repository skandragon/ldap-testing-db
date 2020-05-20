# ldap-testing-db

This is a ldap server with a few pre-defined users set up.

## Administration

The root password for `cn=admin,dc=example,dc=com` is `adminroot123`

## Users

Each user is defined as:

|dn|password|displayName|
|-|-|-|
|uid=user1,ou=Users,dc=example,dc=com|user1password|User One|
|uid=user2,ou=Users,dc=example,dc=com|user2password|User Two|
|uid=user3,ou=Users,dc=example,dc=com|user3password|User Three|
|uid=user4,ou=Users,dc=example,dc=com|user4password|User Four|
|uid=user5,ou=Users,dc=example,dc=com|user5password|(absent)|
|uid=user6,ou=Users,dc=example,dc=com|user6password|User Six|

## Groups

These groups are defined:

|dn|name|members|
|-|-|-|
|cn=AllUsers,ou=Groups,dc=example,dc=com|AllUsers|user1, user2, user3, user4, user5|
|cn=OneTwo,ou=Groups,dc=example,dc=com|OneTwo|user1, user2|
|cn=Administrators,ou=Groups,dc=example,dc=com|Administrators|user2, user4|

There are also 20 groups called LongGroupList01 through LongGroupList20 which only user6 is part of.  This is to make sure that a large group list can be returned, and if rendered to JSON, won't be truncated in some storage.

Each user will see a `memberOf` attribute (which must be explicitly queried for)
in the user record.

## Durability of updates

There is no persistent store defined, nor do I plan on adding this.  This server
is for testing purposes, intended to be brought up and down as needed to run tests or demos.
