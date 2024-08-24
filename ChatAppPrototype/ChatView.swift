import SwiftUI

struct ChatView: View {
    @State private var messages: [ChatMessage] = [
        ChatMessage(text: "Hi Dave. 👋", isUser: false),
        ChatMessage(text: "Mein Name ist Tom, ich bin verantwortlich für Human Resources bei AutoHaus DIN.", isUser: false),
        ChatMessage(text: "Wie alt bist du?", isUser: false),
        ChatMessage(text: "Hi Tom. 👋", isUser: true),
        ChatMessage(text: "Ich bin 21 Jahre alt.", isUser: true),
        ChatMessage(text: "Perfekt, danke. Wieviel Jahre Berufserfahrung hast du?", isUser: false)
    ]
    
    @State private var newMessage: String = ""
    @State private var typingAnimation: Bool = true
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(messages) { message in
                            ChatBubble(message: message.text, isUser: message.isUser, typingAnimation: typingAnimation)  // Pass typingAnimation here
                                .id(message.id)
                        }
                    }
                    .padding()
                    .onChange(of: messages.count) { _ in
                        withAnimation {
                            scrollViewProxy.scrollTo(messages.last?.id, anchor: .bottom)
                        }
                    }
                }
            }
            
            HStack {
                TextField("New message", text: $newMessage)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                
                Button(action: addMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
            .padding()
        }
        .background(Color(.systemIndigo).edgesIgnoringSafeArea(.all))
    }
    
    func addMessage() {
        guard !newMessage.isEmpty else { return }
        
        let userMessage = ChatMessage(text: newMessage, isUser: true)
        messages.append(userMessage)
        
        // Simulate typing animation by delaying the next message
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let responseMessage = ChatMessage(text: "Auto-generated response for \"\(newMessage)\"", isUser: false)
            messages.append(responseMessage)
            typingAnimation.toggle()
        }
        
        newMessage = ""
    }
}
