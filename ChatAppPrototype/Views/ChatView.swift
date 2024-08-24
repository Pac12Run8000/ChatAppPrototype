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
                    .padding()
                    .onChange(of: mediator.messages.count) { _ in
                        withAnimation {
                            scrollViewProxy.scrollTo(mediator.messages.last?.id, anchor: .bottom)
                        }
                    }
                }
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
        .background(Color(.systemIndigo).edgesIgnoringSafeArea(.all))
        .onAppear {
            presenter?.viewDidLoad()
        }
    }
}
