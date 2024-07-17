//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by Jennifer Lee on 7/17/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Student.self)
        }
    }
}
