multiarch:
	docker buildx build \
	    --platform linux/amd64,linux/arm64,linux/arm/v7 \
			-t skandragon/ldap-testing-db:latest \
			-t skandragon/ldap-testing-db:v1.0 . \
			--push

localbuild:
	docker build -t skandragon/ldap-testing-db:latest .
