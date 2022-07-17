VERSION=v0.0.7

docker:
	docker buildx build \
		-f devops/docker/Dockerfile \
		--platform=linux/arm64,linux/amd64,linux/arm/v7 \
		-t registry.lestak.sh/nginx-mo:${VERSION} \
		--push \
		.

.PHONY: docker