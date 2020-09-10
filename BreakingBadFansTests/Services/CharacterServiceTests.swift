@testable import BreakingBadFans
import XCTest

final class CharacterServiceTests: XCTestCase {
    private let mockNetworkService = MockNetworkService(with: .success(Data()))
    private var sut: CharacterService!
    
    override func setUp() {
        super.setUp()
        sut = CharacterService(with: mockNetworkService)
    }
    
    func test_FetchAll_CallsNetworkServiceWithExpecedResource() {
        sut.fetchAll { result in }
        XCTAssertEqual(
            mockNetworkService.resource?.url.absoluteString,
            "https://breakingbadapi.com/api/characters"
        )
        XCTAssertEqual(mockNetworkService.resource?.method, HttpMethod.get)
    }
    
    func test_FetchAll_NetworkServiceReturnsFailure_CallsCompletionWithFailure() {
        sut = CharacterService(
            with: MockNetworkService(
                with: .failure(NetworkError.failed(MockError.mockError))
            )
        )
        
        let expecation = self.expectation(description: #function)
        
        sut.fetchAll { result in
            switch result {
            case .success:
                XCTFail("Un expected result")
            case .failure:
                expecation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_FetchAll_NetworkServiceReturnsSuccessWithEmpty_CallsCompletionWithFailure() {
        let expecation = self.expectation(description: #function)
        
        sut.fetchAll { result in
            switch result {
            case .success:
                XCTFail("Un expected result")
            case .failure:
                expecation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_FetchAll_NetworkServiceReturnsSuccess_CallsCompletionWithSuccess() {
        guard
            let url = Bundle(for: CharacterServiceTests.self).url(forResource: "data", withExtension: "json"),
            let data = try? Data(contentsOf: url)
            else {
            preconditionFailure("Unable to load")
        }
        
        sut = CharacterService(with: MockNetworkService(with: .success(data)))
        let expecation = self.expectation(description: #function)
        
        sut.fetchAll { result in
            switch result {
            case .success(let characters):
                XCTAssertTrue(characters.count == 1)
                XCTAssertEqual(characters.first?.id, 1)
                XCTAssertEqual(characters.first?.name, "Walter White")
                XCTAssertEqual(characters.first?.status, Status.persumedDead)
            case .failure:
                XCTFail("Unexpected result")
            }
            expecation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
