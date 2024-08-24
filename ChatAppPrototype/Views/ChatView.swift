import SwiftUI

struct ChatView: View {
    @ObservedObject var mediator: ChatViewMediator
    var presenter: ChatPresenterInputProtocol?
    @State private var newMessage: String = ""

    var body: some View {
        VStack {
            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(mediator.messages, id: \.id) { message in
                            ChatBubble(message: message.text, isUser: message.isUser)
                                .id(message.id)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8) // Provide additional padding from the top
                    .onChange(of: mediator.messages.count) { _ in
                        withAnimation {
                            scrollViewProxy.scrollTo(mediator.messages.last?.id, anchor: .bottom)
                        }
                    }
                }
                .background(Color.clear) // Keep the background transparent
            }
            
            HStack {
                TextField("New message", text: $newMessage)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                
                Button(action: {
                    presenter?.sendMessage(newMessage)
                    newMessage = ""
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
            .padding()
        }
        .background(Color(.systemIndigo))
                .edgesIgnoringSafeArea([.leading, .trailing]) // Respect the top safe area
                .ignoresSafeArea(edges: .top) // Ignore safe area at the top, but...
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) // Add the safe area inset back to avoid overlap
                .onAppear {
                    presenter?.viewDidLoad()
                }
    }
}
