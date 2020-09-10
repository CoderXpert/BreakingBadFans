@testable import BreakingBadFans

final class MockCharacterListViewController: CharacterListViewControllerProtocol {
    var updateViewStateWasCalled = false
    var state: CharacterListViewState?
    
    func updateViewState(newState: CharacterListViewState) {
        self.updateViewStateWasCalled = true
        self.state = newState
    }
}
