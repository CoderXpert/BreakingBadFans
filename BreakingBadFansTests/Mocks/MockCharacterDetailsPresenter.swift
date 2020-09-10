@testable import BreakingBadFans

final class MockCharacterDetailPresenter: CharacterDetailPresenterProtocol {
    var populateCharacterDetailsWasCalled = false
    var character: BreakingBadCharacter?
    
    func populateCharacterDetails(_ character: BreakingBadCharacter) {
        populateCharacterDetailsWasCalled = true
        self.character = character
    }
}
