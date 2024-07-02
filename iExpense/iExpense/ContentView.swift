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
    @State private var showingSheet = false
    
    
    var body: some View {
        
        VStack{
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Azrael")
            }
            
        }
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


struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String

        var body: some View {
            Text("Hello, \(name)!")
            Button("Dismiss") {
                dismiss()
            }
        }
}

#Preview {
    ContentView()
}
