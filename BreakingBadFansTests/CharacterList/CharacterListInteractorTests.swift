@testable import BreakingBadFans
import XCTest

final class CharacterListInteractorTests: XCTestCase {
    private let mockPresenter = MockCharacterListPresenter()
    private let mockCharacters = MockBreakingBadFans.characters
    private var mockService: MockCharacterService!
    private var sut: CharacterListInteractor!
    
    override func setUp() {
        super.setUp()
        mockService = MockCharacterService(with: .success(mockCharacters))
        sut = CharacterListInteractor(
            service: mockService,
            presenter: mockPresenter
        )
    }
    
    func test_FetchData_CallsShowLoadingOnPresenter() {
        sut.fetchData()
        XCTAssertTrue(mockPresenter.showLoadingWasCalled)
    }
    
    func test_FetchData_CallsFetchAllOnService() {
        sut.fetchData()
        XCTAssertTrue(mockService.fetchAllWasCalled)
    }
    
    func test_FetchData_ServiceReturnsSuccess_CallsShowCharactersOnPresenter() {
        sut.fetchData()
        XCTAssertTrue(mockPresenter.showCharactersWasCalled)
        XCTAssertEqual(mockCharacters, mockPresenter.characters)
    }
}
