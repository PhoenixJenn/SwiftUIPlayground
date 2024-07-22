//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Jennifer Lee on 7/21/24.
//

import SwiftUI
import SwiftData
@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        } .modelContainer(for: Person.self)
    }
}
