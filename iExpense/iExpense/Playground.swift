//
//  SwiftUIView.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/2/24.
//

import SwiftUI


struct Playground: View {
    @State private var user = User()
    @State private var showingSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        

        VStack{
            
            
            Spacer()
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Azrael")
            }
        } // vstack
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
                }
        .padding()
        
        NavigationStack{
            VStack {
                Spacer()
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                
                //List(numbers, id: \.self) {
                //Text("Row \($0)")
                //}
                
                // if you swipe left, you will get a delete button
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }.onDelete(perform: removeRows)
                }
                
            } //vstack
            .toolbar {
                EditButton() // this adds multi delete functionality
            }
        } // navigation
        
        
    } // View
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
    Playground()
}
