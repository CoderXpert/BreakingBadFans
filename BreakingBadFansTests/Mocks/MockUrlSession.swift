@testable import BreakingBadFans
import Foundation

final class MockURLSession: URLSessionType {
    private let data: Data?
    private let response: URLResponse?
    private let error: Error?
    
    var dataTasWasCalled = false
    var request: URLRequest?
    
    init(with data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        dataTasWasCalled = true
        self.request = request
        completionHandler(data, response, error)
        return URLSession.shared.dataTask(with: request)
    }
}
