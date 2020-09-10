@testable import BreakingBadFans
import Foundation

final class MockNetworkService: NetworkServiceProtocol {
    private let result: Result<Data, NetworkError>
    
    var resource: Resource?
    
    init(with result: Result<Data, NetworkError>) {
        self.result = result
    }
    
    func load(_ resource: Resource, completion: @escaping (Result<Data, NetworkError>) -> ()) {
        self.resource = resource
        completion(result)
    }
}
