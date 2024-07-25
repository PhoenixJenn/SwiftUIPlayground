//
//  ContentUnavail.swift
//  Instafilter
//
//  Created by Jennifer Lee on 7/24/24.
//

import SwiftUI

struct ContentUnavail: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ContentUnavailableView("No snippets", systemImage: "swift")
        Divider()
        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        
        Divider()
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentUnavail()
}
