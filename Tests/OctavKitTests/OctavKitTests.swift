import XCTest
@testable import OctavKit

final class OctavKitTests: XCTestCase {
    override func setUp() {
        OctavKit.setup(conferenceId: "xxxx")
        OctavKit.setLocale(Locale(identifier: "ja-JP"))
    }

    // TODO: dummy api connection
    /// Verification
    func testSessions() {
        let expectation = self.expectation(description: "sessions")

        OctavKit.sessions { result in
            switch result {
            case .success(let response):
                print("success count: \(response.count)")
                print("success value: \(response)")
                expectation.fulfill()
            case .failure(let error):
                print("error: \(error)")
            }
        }

        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testSponsors() {
        let expectation = self.expectation(description: "sponsors")
        
        OctavKit.sponsors { result in
            switch result {
            case .success(let response):
                print("success count: \(response.count)")
                print("success value: \(response)")
                expectation.fulfill()
            case .failure(let error):
                print("error: \(error)")
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }

    static var allTests = [
        ("testSessions", testSessions), ("testSponsors", testSponsors)
    ]
}
