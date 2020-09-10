@testable import BreakingBadFans

enum MockError: Error {
    case mockError
}

final class MockCharacterService: CharacterServiceProtocol {
    private let result: Result<[BreakingBadCharacter], Error>
    var fetchAllWasCalled = false
    
    init(with result: Result<[BreakingBadCharacter], Error>) {
        self.result = result
    }
    
    func fetchAll(completion: @escaping (Result<[BreakingBadCharacter], Error>) -> Void) {
        fetchAllWasCalled = true
        completion(result)
    }
}
