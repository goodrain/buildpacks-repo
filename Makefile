all: buildpacks
buildpacks:
	@docker build -t rainbond/buildpack-requirements:cedar-14 buildpack

test: buildpacks
	@docker run --rm -v ${PWD}/lang:/offline rainbond/buildpack-requirements:cedar-14