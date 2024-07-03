//
//  ListWithDeletion.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/3/24.
//

import SwiftUI


struct ListWithDeletion: View {
    
    @State private var selectedNumber = 0
    var colors = ["Red", "Green", "Blue", "Tartan"]
        @State private var selectedColor = "Red"
    @AppStorage("tapCount") private var tapCount = 0
    
    
    var body: some View {
       
        VStack{
            Text("Hello World")
            Button("Tap count: \(tapCount)") {
                        tapCount += 1
            }
            
                   Picker("Select a number", selection: $selectedNumber) {
                       ForEach(0..<10) {
                           Text("\($0)")
                       }
                   }
                   .labelsHidden()
           
        }
        VStack{
            Picker(selection: $selectedNumber, label: EmptyView()) {
                        ForEach(0..<10) {
                            Text("\($0)")
                        }
                    }
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
    ListWithDeletion()
}
