ALL:
	echo "Usage: 'make amd64' or 'make arm64'"
	exit 1

amd64:
	docker build -t skandragon/ldap-testing-db:amd64-latest .
	docker images skandragon/ldap-testing-db:amd64-latest

arm64:
	docker build -t skandragon/ldap-testing-db:arm64-latest .
	docker images skandragon/ldap-testing-db:arm64-latest
