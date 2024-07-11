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
    var counter: Int = 0
    
    public mutating func incrementAmount() {
        self.counter += 1
    }


}

/*:
 
 https://gist.github.com/Ma-He/6b9ebff24061884fde8e2132692a9aa3

 */

@Observable
class Habits {
    
    var items = [Habit](){
        
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = Foundation.UserDefaults.standard.data(forKey: "Items") {
            // let decoder = JSONDecoder()
            // if let decoded = try? decoder.decode([Habit].self, from: items) {
            // self.items = decoded
            // return
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        // self.items = []
        items = []
    }
}
