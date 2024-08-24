import Foundation

protocol ChatInteractorInputProtocol: AnyObject {
    func sendMessage(_ text: String)
    func getMessages() -> [ChatMessage]
}
