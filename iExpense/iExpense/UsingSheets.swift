//
//  UsingSheets.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/9/24.
//

import SwiftUI

struct UsingSheets: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                       // Text(item.amount, format: .currency(code: "USD"))
                        Text(item.amount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(item.amount < 20.00 ? .black : .red)
                    }
                    
                    .fontDesign(.rounded)
                    .fontWidth(.condensed)
                    .lineSpacing(50)
                    //.frame(width: 300)
                    //.font(.headline)
                    //.background(.yellow)
                    //.foregroundStyle(.blue.gradient)
                    
                    
                }
                .onDelete(perform: removeItems)
                
                // adding IDENTIFIABLE we can remove id
//                ForEach(expenses.items, id: \.id) { item in
//                    Text(item.name)
//                }
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                }
            } // toolbar
        } //nav
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
        
        
    } // view
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
        
    
}

#Preview {
    UsingSheets()
}
