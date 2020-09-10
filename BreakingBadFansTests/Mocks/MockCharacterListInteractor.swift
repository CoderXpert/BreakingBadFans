@testable import BreakingBadFans

final class MockCharacterListInteractor: CharacterListInteractorProtocol {
    var fetchDataWasCalled = false
    
    func fetchData() {
        fetchDataWasCalled = true
    }
}
