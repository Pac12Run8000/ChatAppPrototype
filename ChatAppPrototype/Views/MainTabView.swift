import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {
            ChatRouter.createChatModule()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Chats")
                }
            
            // Placeholder for other tabs
            Text("Contacts")
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Contacts")
                }
            
            Text("Settings")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}
