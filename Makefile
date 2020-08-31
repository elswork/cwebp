SNAME ?= cwebp
RNAME ?= elswork/$(SNAME)
VER ?= `cat VERSION`
BASENAME ?= alpine:latest
PARAM ?= cwebp -lossles deftwork.png -o deftwork.webp
OPT ?= -lossless
DIR ?= $$(pwd)/data
EXT ?= png
FILE ?= deftwork

# HELP
# This will output the help for each task

.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS

# Build image

bootstrap: ## Start multicompiler
	docker buildx inspect --bootstrap
buildx: ## Buildx the container
	docker buildx build \
	--platform linux/amd64,linux/arm64,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7,linux/arm/v6 \
  	-t $(RNAME):latest -t $(RNAME):$(VER) --push \
	--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	--build-arg VCS_REF=`git rev-parse --short HEAD` \
	--build-arg BASEIMAGE=$(BASENAME) \
	--build-arg VERSION=$(VER) .

# Operations

console: ## Start console in container
	docker run -it --rm -v $(DIR):/data --entrypoint "/bin/ash" $(RNAME):$(VER)
custom: ## Start a custom command in container
	docker run -it --rm -v $(DIR):/data $(RNAME):$(VER) $(PARAM)
start: ## Start a container command
	docker run -it --rm -v $(DIR):/data $(RNAME):$(VER) cwebp $(OPT) $(FILE).$(EXT) -o $(FILE).webp
bulk: ## Convert all .png from folder and subfolders recursively
	docker run -it --rm -v $(DIR):/data $(RNAME):$(VER) \
	find ./ -type f -name '*.$(EXT)' -exec sh -c 'cwebp $(OPT) $$1 -o "$${1%.$(EXT)}.webp"' _ {} \;
concurrent: ## Convert all .png concurrently
	docker run -it --rm -v $(DIR):/data $(RNAME):$(VER) \
	find ./ -type f -name '*.$(EXT)' | xargs -P 8 -I {} sh -c 'cwebp $(OPT) $$1 -o "$${1%.$(EXT)}.webp"' _ {} \;
