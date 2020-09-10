@testable import BreakingBadFans

final class MockCharacterDetailInteractor: CharacterDetailInteractorProtocol {
    var loadContentWasCalled = false
    func loadContent() {
        loadContentWasCalled = true
    }
}
