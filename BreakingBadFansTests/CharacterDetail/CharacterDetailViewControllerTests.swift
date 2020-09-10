@testable import BreakingBadFans
import XCTest

final class CharacterDetailViewControllerTests: XCTestCase {
    let mockInteractor = MockCharacterDetailInteractor()
    var sut: CharacterDetailViewController!
    
    override func setUp() {
        super.setUp()
        sut = CharacterDetailViewController()
        _ = sut.view
        sut.interactor = mockInteractor
    }
    
    func test_LoadContent_CallsLoadContentOnInteractor() {
        sut.loadContent()
        XCTAssertTrue(mockInteractor.loadContentWasCalled)
    }
}
