.DEFAULT: build

build: Frameworks $(wildcard Package.*) $(wildcard Sources/*/*)
	swift build -c release

.PHONY: Frameworks
Frameworks: Frameworks/EchoGo.xcframework

Frameworks/%.xcframework: Makefile tools $(wildcard Sources/*/*.go) $(shell which gomobile)
	gomobile init
	gomobile bind -target=ios,macos,maccatalyst -x -o $@ ./Sources/$*
	touch $@

.PHONY: tools
tools:
	go generate -tags=tools ./internal/tools

test: build
	go test ./...
	swift test
