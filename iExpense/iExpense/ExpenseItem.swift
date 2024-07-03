//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/3/24.
//

import SwiftUI
import Foundation

struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double


}

// Classes that use @Observable can be used in more than one SwiftUI view, and all of those views will be updated when the properties of the class change.

@Observable
class Expenses {
    var items = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                Foundation.UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = Foundation.UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

 
