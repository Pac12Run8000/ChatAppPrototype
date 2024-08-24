import SwiftUI

struct ChatBubble: View {
    var message: String
    var isUser: Bool
    var typingAnimation: Bool  // Add this line
    
    var body: some View {
        HStack {
            if isUser {
                Spacer()
            }
            
            Text(message)
                .padding()
                .background(isUser ? Color.blue : Color(.systemGray4))
                .foregroundColor(isUser ? .white : .black)
                .cornerRadius(15)
                .frame(maxWidth: 250, alignment: isUser ? .trailing : .leading)
                .overlay(
                    TypingAnimation(isUser: isUser)
                        .opacity(typingAnimation && !isUser ? 1 : 0),
                    alignment: .trailing
                )
            
            if !isUser {
                Spacer()
            }
        }
    }
}
