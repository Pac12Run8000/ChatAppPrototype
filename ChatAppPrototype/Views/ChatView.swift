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
                    .padding(.top, 16) // Provide additional padding from the top
                    .onChange(of: mediator.messages.count) { _ in
                        withAnimation {
                            scrollViewProxy.scrollTo(mediator.messages.last?.id, anchor: .bottom)
                        }
                    }
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top) // Respect the safe area
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
        .background(Color(.systemIndigo).edgesIgnoringSafeArea([.leading, .trailing, .bottom])) // Avoid ignoring the top safe area
        .onAppear {
            presenter?.viewDidLoad()
        }
    }
}
