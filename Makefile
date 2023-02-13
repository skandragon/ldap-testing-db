multiarch:
	docker buildx build \
	    --pull \
	    --platform linux/amd64,linux/arm64 \
			-t skandragon/ldap-testing-db:latest \
			-t skandragon/ldap-testing-db:v1.0.2 . \
			--push

localbuild:
	docker build -t skandragon/ldap-testing-db:latest .
