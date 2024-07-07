//
//  ContentView.swift
//  Navigation
//
//  Created by Jennifer Lee on 7/7/24.
//https://www.hackingwithswift.com/books/ios-swiftui/handling-navigation-the-smart-way-with-navigationdestination

// https://www.hackingwithswift.com/books/ios-swiftui/programmatic-navigation-with-navigationstack

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    
    
    var body: some View {
       Text("Hello")
        
        NavigationStack(path: $path) {
                    VStack {
                        Button("Show 32") {
                            path = [32]
                        }

                        Button("Show 64") {
                            path.append(64)
                        }
                        
                        //This will present a view for 36 then a view for 44, so the user needs to tap Back twice to get back to the root view.
                        Button("Show 36 then 44") {
                            path = [36, 44]
                        }

                    }
                    .navigationDestination(for: Int.self) { selection in
                        Text("You selected \(selection)")
                    }
                }
        
        
    }
}




#Preview {
    ContentView()
}
