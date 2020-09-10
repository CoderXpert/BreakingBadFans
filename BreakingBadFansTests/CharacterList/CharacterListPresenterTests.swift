@testable import BreakingBadFans
import XCTest

final class CharacterListPresenterTests: XCTestCase {
    private let mockViewController = MockCharacterListViewController()
    private var sut: CharacterListPresenter!
    
    override func setUp() {
        super.setUp()
        sut = CharacterListPresenter(viewController: mockViewController)
    }
    
    func test_ShowCharacters_WithEmptyList_CallsUpdateViewStateWithEmptyState() {
        sut.showCharacters([])
        XCTAssertTrue(mockViewController.updateViewStateWasCalled)
        XCTAssertEqual(mockViewController.state, CharacterListViewState.empty)
    }
    
    func test_ShowCharacters_WithCharacters_CallsUpdateViewStateWithLoaded() {
        sut.showCharacters(MockBreakingBadFans.characters)
        XCTAssertTrue(mockViewController.updateViewStateWasCalled)
        if case .loaded(let characters) = mockViewController.state {
            XCTAssertEqual(characters, MockBreakingBadFans.characters)
        } else {
            XCTFail("In valid state")
        }
    }
    
    func test_ShowLoading_CallsUpdateViewStateWithLoading() {
        sut.showLoading()
        XCTAssertTrue(mockViewController.updateViewStateWasCalled)
        XCTAssertEqual(mockViewController.state, CharacterListViewState.loading)
    }
    
    func test_ShowError_CallsUpdateViewStateWithError() {
        sut.showError()
        XCTAssertTrue(mockViewController.updateViewStateWasCalled)
        XCTAssertEqual(mockViewController.state, CharacterListViewState.error)
    }
}
