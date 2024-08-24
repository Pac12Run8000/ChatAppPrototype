import Foundation

class ChatViewMediator: ObservableObject, ChatPresenterOutputProtocol {
    @Published var messages: [ChatMessage] = []
    
    func showMessage(_ message: ChatMessage) {
        messages.append(message)
    }
    
    func displayMessages(_ messages: [ChatMessage]) {
        self.messages = messages
    }
}
