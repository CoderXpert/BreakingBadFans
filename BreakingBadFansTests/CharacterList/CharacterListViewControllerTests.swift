@testable import BreakingBadFans
import XCTest
import UIKit

final class CharacterListViewControllerTests: XCTestCase {
    private let mockInteractor = MockCharacterListInteractor()
    private let sut: CharacterListViewController = {
        let vc = CharacterListViewController()
        vc.collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        vc.errorScreen = UIView()
        vc.activityIndicator = UIActivityIndicatorView(style: .large)
        return vc
    }()
    
    override func setUp() {
        super.setUp()
        _ = sut.view
        sut.dispatchQueue = MockDispatchQueue()
        sut.interactor = mockInteractor
    }
    
    func test_LoadContent_CallsFetchDataOnInteractor() {
        sut.loadContent()
        XCTAssertTrue(mockInteractor.fetchDataWasCalled)
    }
    
    func test_UpdateViewState_StateLoading_UpdateUIToExpectedState() {
        sut.updateViewState(newState: .loading)
        XCTAssertTrue(sut.collectionView.isHidden)
        XCTAssertTrue(sut.errorScreen.isHidden)
        XCTAssertTrue(sut.activityIndicator.isHidden ==  false)
    }
    
    func test_UpdateViewState_StateEmpty_UpdateUIToExpectedState() {
        sut.updateViewState(newState: .empty)
        XCTAssertTrue(sut.collectionView.isHidden)
        XCTAssertTrue(sut.errorScreen.isHidden == false)
        XCTAssertTrue(sut.activityIndicator.isHidden)
    }
    
    func test_UpdateViewState_StateLoaded_UpdateUIToExpectedState() {
        sut.updateViewState(newState: .loaded(MockBreakingBadFans.characters))
        XCTAssertTrue(sut.collectionView.isHidden == false)
        XCTAssertTrue(sut.errorScreen.isHidden)
        XCTAssertTrue(sut.activityIndicator.isHidden)
    }
}
