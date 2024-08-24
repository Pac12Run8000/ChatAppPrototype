import Foundation

protocol ChatInteractorOutputProtocol: AnyObject {
    func didReceiveMessage(_ message: ChatMessage)
}
