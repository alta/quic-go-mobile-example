.DEFAULT: build

build: tools Frameworks $(wildcard Package.*) $(wildcard Sources/*/*)
	swift build --jobs 10 -c release

.PHONY: tools
tools:
	go generate -tags=tools ./internal/tools

.PHONY: Frameworks
Frameworks: Frameworks/EchoGo.xcframework

Frameworks/%.xcframework: Makefile $(wildcard Sources/*/*.go) $(shell which gomobile)
	gomobile init
	gomobile bind -target ios -o $@ ./Sources/$*
	touch $@

test: build
	go test ./...
	swift test
