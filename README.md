# [QUIC](https://quicwg.org/) + [gomobile](https://pkg.go.dev/golang.org/x/mobile/cmd/gomobile) + [Swift Package Manager](https://swift.org/package-manager/)

Example [Go](https://golang.org/) package built into an [XCFramework](https://developer.apple.com/documentation/swift_packages/distributing_binary_frameworks_as_swift_packages) for [Swift Package Manager](https://swift.org/package-manager/). This package implements a simple QUIC [datagram](https://github.com/quicwg/datagram) server using [quic-go](https://github.com/https://github.com/lucas-clemente/quic-go).

Depends on <https://golang.org/cl/310949> (merged as of 2021-07-10).

## Requirements

This package can be built and run on any modern macOS system with Go, Swift 5.3, and Xcode 11 or later.

## Usage

To build the XCFramework and Swift package: `make build`

To test: `make test`

## Author

© Alta Software, LLC
