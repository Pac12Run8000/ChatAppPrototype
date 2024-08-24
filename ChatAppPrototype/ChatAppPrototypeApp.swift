//
//  ChatAppPrototypeApp.swift
//  ChatAppPrototype
//
//  Created by Norbert Grover on 8/23/24.
//

import SwiftUI

@main
struct ChatAppPrototypeApp: App {
    var body: some Scene {
        WindowGroup {
            ChatRouter.createChatModule()
        }
    }
}
