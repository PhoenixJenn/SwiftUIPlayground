//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Jennifer Lee on 7/19/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
