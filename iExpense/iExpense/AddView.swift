//
//  AddView.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/3/24.
//

import SwiftUI

struct AddView: View {
    
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
                    .navigationTitle("Add new expense")
                    .toolbar {
                        Button("Save") {
                            let item = ExpenseItem(name: name, type: type, amount: amount)
                            expenses.items.append(item)
                            dismiss()
                        }
                        
                    }
                }
        
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
