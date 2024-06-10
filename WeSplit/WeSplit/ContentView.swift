//
//  ContentView.swift
//  WeSplit
//
//  Created by Jennifer Lee on 6/10/24.
// Command + R   will run the simulator

import SwiftUI

// ContentView is a struct; could be a constant; can't change properties freely; mutating
// can't make mutating vars
// use a property wrapper: @State

struct ContentView: View {
    @State private var tapCount = 0

        var body: some View {
            Button("Tap Count: \(tapCount)") {
                self.tapCount += 1
            }
        
//        NavigationStack{
//            Form {
//                Text("Hello, Cali!")
//                Section{
//                    Text("Hello, MDR!")
//                }
//                
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline) // this makes title smaller
//            // should probably delete the VStack
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
//                Text("Hello, world!")
//                
//                Form {
//                    Section{
//                        Text("Hello, Azrael!")
//                    }
//                    Text("Hello, LA!")
//                }
//            }
//            .padding()
//            
//        }
        
        
    }
}

#Preview {
    ContentView()
}
