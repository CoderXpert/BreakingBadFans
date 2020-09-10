@testable import BreakingBadFans

final class MockCharacterListPresenter: CharacterListPresenterProtocol {
    var showLoadingWasCalled = false
    var showErrorWasCalled = false
    var showCharactersWasCalled = false
    var characters: [BreakingBadCharacter]?
    
    func showCharacters(_ characters: [BreakingBadCharacter]) {
        showCharactersWasCalled = true
        self.characters = characters
    }
    
    func showLoading() {
        showLoadingWasCalled = true
    }
    
    func showError() {
        showErrorWasCalled = true
    }
}
