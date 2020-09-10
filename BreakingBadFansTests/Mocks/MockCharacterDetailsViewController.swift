@testable import BreakingBadFans
import Foundation

final class MockCharacterDetailsViewController: CharacterDetailViewControllerProtocol {
    var updateUIWasCalled = false
    var imageUrl: URL?
    var name: String?
    var nickName: NSAttributedString?
    var occuption: NSAttributedString?
    var status: NSAttributedString?
    var appearance: NSAttributedString?
    
    func updateUI(
        imageUrl: URL,
        name: String,
        nickName: NSAttributedString,
        occuption: NSAttributedString,
        status: NSAttributedString,
        appearance: NSAttributedString
    ) {
        updateUIWasCalled = true
        self.imageUrl = imageUrl
        self.name = name
        self.nickName = nickName
        self.occuption = occuption
        self.status = status
        self.appearance = appearance
    }
}
