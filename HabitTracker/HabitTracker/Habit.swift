//
//  Habit.swift
//  HabitTracker
//
//  Created by Jennifer Lee on 7/10/24.
//

import Foundation

struct Habit : Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    let counter: Int?
   // let somefield : String?

}


@Observable
class Habits {
    var items = [Habit](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                Foundation.UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = Foundation.UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}
