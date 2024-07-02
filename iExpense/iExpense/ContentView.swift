//
//  ContentView.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/1/24.
// https://www.hackingwithswift.com/books/ios-swiftui/iexpense-introduction

import SwiftUI
import Observation
 

struct ContentView: View {
    @State private var selectedNumber = 0
    var colors = ["Red", "Green", "Blue", "Tartan"]
        @State private var selectedColor = "Red"
    
    var body: some View {
        
        VStack{
            Text("Hello World")
           
                   Picker("Select a number", selection: $selectedNumber) {
                       ForEach(0..<10) {
                           Text("\($0)")
                       }
                   }
                   .labelsHidden()
           
        }
         
        
        VStack {
                    Picker("Please choose a color", selection: $selectedColor) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    Text("You selected: \(selectedColor)")
                }
            
        
        
    }
}

#Preview {
    ContentView()
}
