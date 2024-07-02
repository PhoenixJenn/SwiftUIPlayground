//
//  ContentView.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/1/24.
// https://www.hackingwithswift.com/books/ios-swiftui/iexpense-introduction


/*:
 @AppStorage is easier than UserDefaults: it’s one line of code rather than two, and it also means we don’t have to repeat the key name each time. However, right now at least @AppStorage doesn’t make it easy to handle storing complex objects such as Swift structs
 */

/*:
 Important: When it comes to you submitting an app to the App Store, Apple asks that you let them know why you're loading and saving data using UserDefaults. This also applies to the @AppStorage property wrapper. It's nothing to worry about, they just want to make sure developers aren't trying to identify users across apps.
 */
import SwiftUI
import Observation
 

struct ContentView: View {
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
    ContentView()
}
