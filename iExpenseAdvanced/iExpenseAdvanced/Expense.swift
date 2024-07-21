//
//  Expense.swift
//  iExpenseAdvanced
//
//  Created by Jennifer Lee on 7/21/24.
//

import Foundation
import SwiftData

// : Identifiable, Codable
@Model
class Expense  {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double

    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}




// Classes that use @Observable can be used in more than one SwiftUI view, and all of those views will be updated when the properties of the class change.
//@Observable
//class Expenses {
//    var items = [ExpenseItem](){
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                Foundation.UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    
//    init() {
//        if let savedItems = Foundation.UserDefaults.standard.data(forKey: "Items") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                items = decodedItems
//                return
//            }
//        }
//
//        items = []
//    }
//}

 
