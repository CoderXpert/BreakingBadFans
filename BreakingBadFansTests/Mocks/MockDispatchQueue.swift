@testable import BreakingBadFans
import Foundation

final class MockDispatchQueue: DispatchQueueType {
    func async(execute workItem: DispatchWorkItem) {
        workItem.perform()
    }
}

