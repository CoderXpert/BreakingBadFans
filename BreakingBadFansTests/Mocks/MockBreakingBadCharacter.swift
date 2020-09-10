@testable import BreakingBadFans
import Foundation

struct MockBreakingBadFans {
    static let character = BreakingBadCharacter(
        id: 1,
        name: "testName",
        nickName: "TestNickName",
        imageUrl: URL(string: "test.com")!,
        occupation: ["Teacher"],
        status: .alive,
        seasonAppearance: [1,2]
    )
    
    static var characters: [BreakingBadCharacter] {
        [character]
    }
}
