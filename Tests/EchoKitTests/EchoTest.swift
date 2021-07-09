import XCTest

@testable import EchoGo

class EchoTests: XCTestCase {
	static let host = "localhost"
	static let port = Int.random(in: 1025 ..< Int(Int16.max))
	static let server = Process()

	override class func setUp() {
		super.setUp()

		let directory = URL(fileURLWithPath: #filePath)
			.deletingLastPathComponent() // EchoKitTests
			.deletingLastPathComponent() // Tests
			.deletingLastPathComponent() // Repo root

		server.currentDirectoryURL = directory
		server.executableURL = URL(fileURLWithPath: "/bin/sh")
		server.arguments = ["-c", "go run ./cmd/server -a \(host):\(port)"]
		server.environment = ProcessInfo.processInfo.environment

		do {
			try server.run()
		} catch {
			XCTFail("Failed to start test QUIC server.")
		}

		// Give the server a chance to start up
		sleep(4)
	}

	override class func tearDown() {
		server.terminate()
		super.tearDown()
	}

	func testEcho() throws {
		let addr = "\(Self.host):\(Self.port)"
		let message = "Hello QUIC!"
		var error: NSErrorPointer = nil

		let response = GoEcho(addr, message, error)

		XCTAssertEqual(response, message)
		XCTAssertEqual(error, nil)
	}
}
