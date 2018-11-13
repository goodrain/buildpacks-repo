all: buildpacks
buildpacks:
	@docker build -t rainbond/buildpack-requirements:cedar-14 buildpack

buildpacks-cn:
	@docker build -t rainbond/buildpack-requirements:cedar-14 -f buildpack/Dockerfile.cn buildpack

test: buildpacks
	@docker run --rm -v ${PWD}/lang:/offline rainbond/buildpack-requirements:cedar-14
