@testable import BreakingBadFans
import XCTest

final class CharacterDetailInteractorTests: XCTestCase {
    private let mockPresenter = MockCharacterListPresenter()
    private let mockCharacters = MockBreakingBadFans.characters
    private var mockService: MockCharacterService!
    
    override func setUp() {
        super.setUp()
        mockService = MockCharacterService(with: .success(mockCharacters))
    }
    
    func test_FetchDataCall_ServiceFetchAll() {
        let sut = CharacterListInteractor(
            service: mockService,
            presenter: mockPresenter
        )
        sut.fetchData()
        XCTAssertTrue(mockService.fetchAllWasCalled)
    }
    
    func test_FetchData_ServiceReturnsSuccess_CallsShowCharacterOnPresenter() {
        let sut = CharacterListInteractor(
            service: mockService,
            presenter: mockPresenter
        )
        sut.fetchData()
        XCTAssertTrue(mockPresenter.showCharactersWasCalled)
        XCTAssertEqual(mockPresenter.characters, mockCharacters)
    }
    
    func test_FetchData_ServiceReturnsFailure_CallsShowErrorOnPresenter() {
        let sut = CharacterListInteractor(
            service: MockCharacterService(with: .failure(MockError.mockError)),
            presenter: mockPresenter
        )
        sut.fetchData()
        XCTAssertTrue(mockPresenter.showErrorWasCalled)
    }
}
