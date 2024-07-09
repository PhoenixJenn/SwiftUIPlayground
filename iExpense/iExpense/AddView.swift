//
//  AddView.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/3/24.
//

import SwiftUI

struct AddView: View {
    
   // @State private var name = "New Expense"
     @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @Environment(\.dismiss) var dismiss
    //If you want to dismiss a view, you need to use the environment to read the correct dismiss action for however the view is being shown.
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        
        
        NavigationStack {
            
                    Form {
                        TextField("Name", text: $name)

                        Picker("Type", selection: $type) {
                            ForEach(types, id: \.self) {
                                Text($0)
                            }
                        }

                        TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                        
                        
                    }
            /*:
             use @State private var name = "New expense"
             .navigationTitle($name)
             .navigationBarTitleDisplayMode(.inline)
             
             */
                    .navigationTitle("Add new expense")
                    //.navigationTitle($name)
                   // .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden()
                 
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button("Save") {
                                let item = ExpenseItem(name: name, type: type, amount: amount)
                                expenses.items.append(item)
                                dismiss()
                            }
                            
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                dismiss()
                            }
                        }
                        /*:
                         https://www.hackingwithswift.com/books/ios-swiftui/placing-toolbar-buttons-in-exact-locations
                         Differente actions:
                         .confirmationAction, when you want users to agree to something, such as agreeing to terms of service.
                         .destructiveAction, when the user needs to make a choice to destroy whatever it is they are working with, such as confirming they want to remove some data they created.
                         .cancellationAction, when the user needs to back out of changes they have made, such as discarding changes they have made.
                         .navigation, which is used for buttons that make the user move between data, such as going back and forward in a web browser.
                         
                         https://swiftwithmajid.com/2020/07/15/mastering-toolbars-in-swiftui/
                         There are placement options that we can use only in toolbars presented by a modal view.

                         confirmationAction - The item represents a confirmation action for a modal interface. You can use it in your sheets to confirm saving action.
                         cancellationAction - The item represents a cancellation action for a modal interface.
                         destructiveAction - The item represents a destructive action for a modal interface. You can use it in your modal screens that delete some data.
                         
                         */
                        
                    }
            

                }
        
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
