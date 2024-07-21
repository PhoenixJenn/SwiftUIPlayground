//
//  FoodAndWinePassportApp.swift
//  FoodAndWinePassport
//
//  Created by Jennifer Lee on 7/20/24.
//

import SwiftUI
import SwiftData

@main
struct FoodAndWinePassportApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Location.self)
        }
    }
}
