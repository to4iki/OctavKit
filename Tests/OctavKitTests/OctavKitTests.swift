import XCTest
@testable import OctavKit

final class OctavKitTests: XCTestCase {
    override func setUp() {
        OctavKit.setup(conferenceId: "xxxx")
    }

    // TODO: dummy api connection
    /// Verification
    func testSessions() {
        let expectation = self.expectation(description: "sessions")

        OctavKit.sessions { result in
            switch result {
            case .success(let value):
                print("success: \(value.count)")
                expectation.fulfill()
            case .failure(let error):
                print("error: \(error)")
            }
        }

        waitForExpectations(timeout: 3, handler: nil)
    }

    static var allTests = [
        ("testSessions", testSessions),
    ]
}
