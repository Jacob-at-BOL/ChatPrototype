//
//  ChatPrototypeApp.swift
//  ChatPrototype
//
//  Created by Jacob on 7/25/24.
//

import SwiftUI
import SwiftData

@main
struct ChatPrototypeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
