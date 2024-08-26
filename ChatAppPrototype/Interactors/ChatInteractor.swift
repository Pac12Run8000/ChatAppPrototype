import Foundation


class ChatInteractor: ChatInteractorInputProtocol {
    weak var presenter: ChatInteractorOutputProtocol?
    private var messages: [ChatMessage] = [
        ChatMessage(text: "Hi Dave. 👋", isUser: false),
        ChatMessage(text: "Hello, let's do this", isUser: false),
        ChatMessage(text: "I think that Dimitri is up for a world title", isUser: false),
        ChatMessage(text: "Hi Tom. 👋", isUser: true),
        ChatMessage(text: "Let's travel to Japan.", isUser: true),
        ChatMessage(text: "Let's travel to Brazil and the UK?", isUser: false)
    ]

    func sendMessage(_ text: String) {
        let userMessage = ChatMessage(text: text, isUser: true)
        messages.append(userMessage)
        presenter?.didReceiveMessage(userMessage)
        
        // Simulate response
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let responseMessage = ChatMessage(text: "Auto-generated response for \"\(text)\"", isUser: false)
            self.messages.append(responseMessage)
            self.presenter?.didReceiveMessage(responseMessage)
        }
    }
    
    func getMessages() -> [ChatMessage] {
        return messages
    }
}

