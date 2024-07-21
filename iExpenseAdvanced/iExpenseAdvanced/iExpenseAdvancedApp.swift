//
//  iExpenseAdvancedApp.swift
//  iExpenseAdvanced
//
//  Created by Jennifer Lee on 7/21/24.
//

import SwiftUI
import SwiftData

@main
struct iExpenseAdvancedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
