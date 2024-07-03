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

/*: CHALLENGE
 [x] Use the user’s preferred currency, rather than always using US dollars.
 [ ] Modify the expense amounts in ContentView to contain some styling depending on their value – expenses under $10 should have one style, expenses under $100 another, and expenses over $100 a third style. What those styles are depend on you.
 [ ] For a bigger challenge, try splitting the expenses list into two sections: one for personal expenses, and one for business expenses. This is tricky for a few reasons, not least because it means being careful about how items are deleted!
 
 
 */
import SwiftUI
import Observation
 

struct ContentView: View {

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
    ContentView()
}
