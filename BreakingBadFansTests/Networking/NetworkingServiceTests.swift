@testable import BreakingBadFans
import Foundation
import XCTest

final class NetworkingServiceTests: XCTestCase {
    private let resource = Resource(url: URL(string: "test.com")!, method: .get)
    private let mockUrlSession = MockURLSession(with: Data(), response: nil, error: nil)
    private var sut: NetworkService!
    
    override func setUp() {
        super.setUp()
        sut = NetworkService(with: mockUrlSession)
    }
    
    func test_Load_CallsDataTaskOnURLSessionWithExpectedRequest() {
        sut.load(resource) { result in }
        XCTAssert(mockUrlSession.dataTasWasCalled)
        XCTAssertEqual(mockUrlSession.request?.url?.absoluteString, "test.com")
        XCTAssertEqual(mockUrlSession.request?.httpMethod, "GET")
    }
    
    func test_Load_URLSessionReturnsData_CallCompletionWithSuccess() {
        let expecation = self.expectation(description: #function)
        sut.load(resource) { result in
            switch result {
            case .failure:
                XCTFail("Unexpected result")
            case .success:
                expecation.fulfill()
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_Load_URLSessionReturnsError_CallCompletionWithFailure() {
        sut = NetworkService(
            with: MockURLSession(
                with: Data(),
                response: nil,
                error: MockError.mockError
            )
        )
        let expecation = self.expectation(description: #function)
        sut.load(resource) { result in
            switch result {
            case .failure:
                expecation.fulfill()
            case .success:
                XCTFail("unexpected result")
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_Load_URLSessionReturnsNilErrorNilData_CallCompletionWithFailure() {
        sut = NetworkService(
            with: MockURLSession(
                with: nil,
                response: nil,
                error: nil
            )
        )
        let expecation = self.expectation(description: #function)
        sut.load(resource) { result in
            switch result {
            case .failure:
                expecation.fulfill()
            case .success:
                XCTFail("unexpected result")
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}
