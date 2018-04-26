import XCTest
@testable import OctavKit

final class OctavKitTests: XCTestCase {
    override func setUp() {
        OctavKit.setup(conferenceId: "")
        OctavKit.setLocale(Locale(identifier: "ja-JP"))
    }

    // TODO: dummy api connection
    /// Verification
    func testSessions() {
        let expectation = self.expectation(description: "sessions")

        OctavKit.sessions { (value, error) in
            switch (value, error) {
            case (let value?, _):
                print("success count: \(value.count)")
                print("success value: \(value)")
                expectation.fulfill()
            case (_, let error?):
                print("error: \(error)")
            case (.none, .none):
                XCTFail("unreachable")
            }
        }

        waitForExpectations(timeout: 3, handler: nil)
    }

    func testSponsors() {
        let expectation = self.expectation(description: "sponsors")

        OctavKit.sponsors { (value, error) in
            switch (value, error) {
            case (let value?, _):
                print("success count: \(value.count)")
                print("success value: \(value)")
                expectation.fulfill()
            case (_, let error?):
                print("error: \(error)")
            case (.none, .none):
                XCTFail("unreachable")
            }
        }

        waitForExpectations(timeout: 3, handler: nil)
    }

    func testConference() {
        let expectation = self.expectation(description: "conference")

        OctavKit.conference { (value, error) in
            switch (value, error) {
            case (let value?, _):
                print("success value: \(value)")
                expectation.fulfill()
            case (_, let error?):
                print("error: \(error)")
            case (.none, .none):
                XCTFail("unreachable")
            }
        }

        waitForExpectations(timeout: 3, handler: nil)
    }

    static var allTests = [
        ("testSessions", testSessions), ("testSponsors", testSponsors), ("testConference", testConference)
    ]
}
