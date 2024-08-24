import SwiftUI

struct TypingAnimation: View {
    @State private var dots = ""
    @State var isUser: Bool
    
    var body: some View {
        Text("...")
            .padding(.vertical, 2)
            .padding(.horizontal, 10)
            .background(Color(.systemGray4))
            .foregroundColor(.black)
            .cornerRadius(10)
            .animation(
                Animation.linear(duration: 0.5)
                    .repeatForever(autoreverses: true)
            )
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                    dots = dots.count < 3 ? dots + "." : ""
                }
            }
    }
}
