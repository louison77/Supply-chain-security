.PHONY: all lint build coverage dev  gen

all: build

## Pipeline

build:
		@go build  -o Supply-chain-security cmd/Supply-chain-security/main.go
release: 
		
		goreleaser release --clean 