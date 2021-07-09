# QUIC + Go + gomobile + Swift Package Manager

Example [Go](https://golang.org/) package built into an [XCFramework](https://developer.apple.com/documentation/swift_packages/distributing_binary_frameworks_as_swift_packages) for [Swift Package Manager](https://swift.org/package-manager/). This package implements a simple [QUIC](https://quicwg.org/) [datagram](https://github.com/quicwg/datagram) server using [quic-go](https://github.com/https://github.com/lucas-clemente/quic-go).

Depends on <https://golang.org/cl/310949>.

## Requirements

This package can be built and run on any modern macOS system with Go, Swift 5.3, and Xcode 11 or later.

## Usage

To build the XCFramework and Swift package: `make build`

To test: `make test`

## Author

© Alta Software, LLC
