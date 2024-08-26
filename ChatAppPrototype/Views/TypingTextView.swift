import SwiftUI

struct TypingTextView: View {
    @State private var displayedText: String = ""
    var fullText: String
    var animateTyping: Bool

    var body: some View {
        Text(displayedText)
            .onAppear {
                if animateTyping {
                    animateText()
                } else {
                    displayedText = fullText
                }
            }
    }

    private func animateText() {
        displayedText = ""
        let characters = Array(fullText)
        for (index, char) in characters.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05 * Double(index)) {
                displayedText.append(char)
            }
        }
    }
}
