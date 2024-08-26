import SwiftUI

struct ChatView: View {
    @ObservedObject var mediator: ChatViewMediator
    var presenter: ChatPresenterInputProtocol?
    @State private var newMessage: String = ""
    @State private var animateTyping: Bool = true // Toggle state

    var body: some View {
        VStack {
            Toggle("Enable Typing Animation", isOn: $animateTyping)
                .padding()

            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(mediator.messages, id: \.id) { message in
                            ChatBubble(message: message.text, isUser: message.isUser, animateTyping: animateTyping)
                                .id(message.id)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .onChange(of: mediator.messages.count) { _ in
                        withAnimation {
                            scrollViewProxy.scrollTo(mediator.messages.last?.id, anchor: .bottom)
                        }
                    }
                }
                .background(Color.clear)
            }
            
            HStack {
                TextField("New message", text: $newMessage)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                
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
        .edgesIgnoringSafeArea([.leading, .trailing])
        .ignoresSafeArea(edges: .top)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
        .onAppear {
            presenter?.viewDidLoad()
        }
    }
}
