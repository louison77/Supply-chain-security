.PHONY: all lint build coverage dev  gen

GIT_SHA := $(shell git rev-parse HEAD)


CODE_DIR := ./cmd/supply-chain-security
REGISTRY :=ghcr.io
REPO:=louison77
KO_IMAGE:=supply-chain-security
KO_REPO:=$(REGISTRY)/$(REPO)/$(KO_IMAGE)
ifndef VERSION
KO_TAGS             := $(GIT_SHA)
else ifeq ($(VERSION),main)
KO_TAGS             := $(GIT_SHA),latest
else
KO_TAGS             := $(GIT_SHA),$(subst /,-,$(VERSION))
endif

all: build

## Pipeline

build:
		@go build  -o supply-chain-security cmd/supply-chain-security/main.go
release: 
		
		goreleaser release --clean 

ko-build:
	
	KO_DOCKER_REPO=$(KO_REPO) ko build $(CODE_DIR) --bare --sbom=cyclonedx --tags=$(KO_TAGS) --platform=all 