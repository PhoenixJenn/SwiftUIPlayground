//
//  ContentView.swift
//  WeSplit
//
//  Created by Jennifer Lee on 6/10/24.
// Command + R   will run the simulator
// Day 16 https://www.hackingwithswift.com/100/swiftui/16
// "views are a function of their state"

import SwiftUI

// ContentView is a struct; could be a constant; can't change properties freely; mutating
// can't make mutating vars
// use a property wrapper: @State

struct ContentView: View {
    var body: some View {
        Text("Hello World!")
    }
}
//    let students = ["Harry", "Hermione", "Ron"]
//    @State private var selectedStudent = "Harry"
//    
//    @State private var tapCount = 0
//    // two way binding
//    @State private var name = ""
    

//        var body: some View {
           
//            Form{
//                Button("Tap Count: \(tapCount)") {
//                    self.tapCount += 1
//                }
//                
//                Text("Hello, \(name)!")
//                // use dollar sign $ = two-way binding; read and write value
//                TextField("Enter your name..",text: $name)
//                
//                Picker("Select your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//                
////                ForEach(0..<10) { number in
////                        Text("Row \(number)")
////                }
//                // can use shorter statement
//                ForEach(0 ..< 100) {
//                        Text("Row \($0)")
//                }
//                
//                
//            }
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
        
        
//    }
//}

#Preview {
    ContentView()
}
