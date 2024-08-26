import SwiftUI

struct ChatBubble: View {
    var message: String
    var isUser: Bool
    var animateTyping: Bool

    var body: some View {
        HStack {
            if isUser {
                Spacer()
            }

            TypingTextView(fullText: message, animateTyping: animateTyping)
                .padding()
                .background(isUser ? Color.blue : Color(.systemGray4))
                .foregroundColor(isUser ? .white : .black)
                .cornerRadius(15)
                .frame(maxWidth: 250, alignment: isUser ? .trailing : .leading)

            if !isUser {
                Spacer()
            }
        }
    }
}
