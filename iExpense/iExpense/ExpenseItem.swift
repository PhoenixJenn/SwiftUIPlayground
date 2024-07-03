//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/3/24.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double

    
    var body: some View {
        
    
       
        
        Text("Hello")
    }
}


@Observable
class Expenses {
    var items = [ExpenseItem]()
}

 
