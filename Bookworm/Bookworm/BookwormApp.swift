//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Jennifer Lee on 7/16/24.
//
/*:
 A model container is SwiftData's name for where it stores its data.
 */
import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        } 
        .modelContainer(for: Book.self)
        
    }
}


