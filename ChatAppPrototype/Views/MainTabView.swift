import SwiftUI

struct MainTabView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 26/255, green: 27/255, blue: 45/255, alpha: 1.0) // #1A1B2D
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 91/255, green: 99/255, blue: 122/255, alpha: 1.0) // #5B637A
    }
   
    var body: some View {
        TabView {
            Text("Contacts")
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Contacts")
                }
            ChatRouter.createChatModule()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Chats")
                }
            Text("Settings")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}
