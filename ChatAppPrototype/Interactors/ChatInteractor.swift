import Foundation


class ChatInteractor: ChatInteractorInputProtocol {
    weak var presenter: ChatInteractorOutputProtocol?
    private var messages: [ChatMessage] = [
        ChatMessage(text: "Hi Dave. 👋", isUser: false),
        ChatMessage(text: "Mein Name ist Tom, ich bin verantwortlich für Human Resources bei AutoHaus DIN.", isUser: false),
        ChatMessage(text: "Wie alt bist du?", isUser: false),
        ChatMessage(text: "Hi Tom. 👋", isUser: true),
        ChatMessage(text: "Ich bin 21 Jahre alt.", isUser: true),
        ChatMessage(text: "Perfekt, danke. Wieviel Jahre Berufserfahrung hast du?", isUser: false)
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

