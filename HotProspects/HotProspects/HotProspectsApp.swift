//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//

import SwiftUI
import SwiftData
@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
