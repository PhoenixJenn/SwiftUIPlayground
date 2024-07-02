//
//  ContentView.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/1/24.
// https://www.hackingwithswift.com/books/ios-swiftui/iexpense-introduction

import SwiftUI
import Observation

struct ContentView: View {
    @State private var user = User()
    
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
                }
        .padding()
    }
}

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}


#Preview {
    ContentView()
}
