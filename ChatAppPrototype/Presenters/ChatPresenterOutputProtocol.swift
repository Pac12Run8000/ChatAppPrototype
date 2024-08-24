import Foundation

protocol ChatPresenterOutputProtocol: AnyObject {
    func showMessage(_ message: ChatMessage)
    func displayMessages(_ messages: [ChatMessage])
}
