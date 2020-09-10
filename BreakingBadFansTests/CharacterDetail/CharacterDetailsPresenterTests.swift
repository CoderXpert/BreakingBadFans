@testable import BreakingBadFans
import XCTest

final class CharacterDetailsPresenterTests: XCTestCase {
    private let mockCharacter = MockBreakingBadFans.character
    private let mockViewController = MockCharacterDetailsViewController()
    private var sut: CharacterDetailPresenter!
    
    override func setUp() {
        super.setUp()
        sut = CharacterDetailPresenter(with: mockViewController)
    }
    
    func test_PopulateCharacterDetails_CallsUpdateUIOnViewController() {
        sut.populateCharacterDetails(mockCharacter)
        XCTAssertTrue(mockViewController.updateUIWasCalled)
        XCTAssertEqual(mockViewController.name, "testName")
        XCTAssertEqual(mockViewController.nickName?.string, "Also knonw as TestNickName")
        XCTAssertEqual(mockViewController.imageUrl?.absoluteString, "test.com")
        XCTAssertEqual(mockViewController.occuption?.string, "Works as Teacher")
        XCTAssertEqual(mockViewController.status?.string, "Status Alive")
        XCTAssertEqual(mockViewController.appearance?.string, "Appeared in 1 and 2")
    }
}
