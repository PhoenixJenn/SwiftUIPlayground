//
//  ContentView.swift
//  iExpenseAdvanced
//
//  Created by Jennifer Lee on 7/21/24.
//

/*:
 @AppStorage is easier than UserDefaults: it’s one line of code rather than two, and it also means we don’t have to repeat the key name each time. However, right now at least @AppStorage doesn’t make it easy to handle storing complex objects such as Swift structs
 */

/*:
 Important: When it comes to you submitting an app to the App Store, Apple asks that you let them know why you're loading and saving data using UserDefaults. This also applies to the @AppStorage property wrapper. It's nothing to worry about, they just want to make sure developers aren't trying to identify users across apps.
 */

/*: CHALLENGE

 [ ] For a bigger challenge, try splitting the expenses list into two sections: one for personal expenses, and one for business expenses. This is tricky for a few reasons, not least because it means being careful about how items are deleted!
 
 CHALLENGE: https://www.hackingwithswift.com/books/ios-swiftui/navigation-wrap-up
 
 [x]Change project 7 (iExpense) so that it uses NavigationLink for adding new expenses rather than a sheet.
 (Tip: The dismiss() code works great here, but you might want to add the navigationBarBackButtonHidden() modifier so they have to explicitly choose Cancel.)
 [] Try changing project 7 so that it lets users edit their issue name in the navigation title rather than a separate textfield. Which option do you prefer?
 
 [] Start by upgrading it to use SwiftData.
 [] Add a customizable sort order option: by name or by amount.
 [] Add a filter option to show all expenses, just personal expenses, or just business expenses.
 
 */
import SwiftUI
import SwiftData
//import Observation

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    //@State private var expenses = Expense()
    @State private var showingAddExpense = false
    @Query var expenses : [Expense]
    
    var body: some View {
        
        NavigationStack {
            NavigationLink("Add Item") {
                //
                AddExpenseView()
                //AddExpenseView(expense: Expense(name: "", type: "Personal", amount: 0.00))
            }
            List {
                ForEach(expenses) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(item.amount < 20.00 ? .black : .red)
                    }
                    
                    .fontDesign(.rounded)
                    .fontWidth(.condensed)
                    .lineSpacing(50)

                } // foreach
                .onDelete(perform: removeItems)
                
            }//list
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            } // toolbar
        } //nav
        .sheet(isPresented: $showingAddExpense) {
            AddExpenseView()
            //AddExpenseView(expense: Expense(name: "", type: "Personal", amount: 0.00))
        }
        
        
    } // view
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets{
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
        //expenses.items.remove(atOffsets: offsets)
    }
}



#Preview {
    ContentView()
}
