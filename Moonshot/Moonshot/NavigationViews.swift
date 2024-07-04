//
//  NavigationViews.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/4/24.
// https://www.hackingwithswift.com/books/ios-swiftui/pushing-new-views-onto-the-stack-using-navigationlink

import SwiftUI

struct NavigationViews: View {
    var body: some View {
        
        // lists are magical with navigation link and closures
        // shows gray disclosure indicators on the right edge
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
        
        
//        NavigationStack {
//            NavigationLink("Tap Me") {
//                Text("Detail View")
//            }
//            .navigationTitle("SwiftUI")
//        }
        
        Divider()
        NavigationStack {
            NavigationLink {
                Text("Detail View")
            } label: {
                VStack {
                    Text("This is the label")
                    Text("So is this")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
        }
        
        
    }
}

#Preview {
    NavigationViews()
}
