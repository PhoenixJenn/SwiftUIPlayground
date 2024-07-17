//
//  Habit.swift
//  HabitTracker
//
//  Created by Jennifer Lee on 7/10/24.
//
/*:
 https://gist.github.com/Ma-He/6b9ebff24061884fde8e2132692a9aa3
 // https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-published-property-wrapper
 //https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-observedobject-property-wrapper
 //https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-published-property-wrapper

 // @Observable
 //class Habit : ObservableObject
 That Habits class uses @Published so it will automatically send change announcements when habits changes,
 and ContentView uses @ObservedObject to watch for those announcements. Without @ObservedObject the change announcements would be sent but ignored.
 */


import Foundation
//equatable
struct Habit : Identifiable, Codable  {
    var id = UUID()
    let name: String
    let description: String
    var counter: Int = 0
    
    public mutating func incrementCounter() {
        self.counter += 1
    }
}


class HabitStorage  : ObservableObject {
    
    @Published var habitArray = [Habit](){
        
        didSet {
            if let encoded = try? JSONEncoder().encode(habitArray) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let habitArray = UserDefaults.standard.data(forKey: "Habits") {
            // let decoder = JSONDecoder()
            // if let decoded = try? decoder.decode([Habit].self, from: items) {
            //    self.items = decoded
            //    return
            //}
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: habitArray) {
                // without self. it won't let you set this since it is a constant/let
                self.habitArray = decodedHabits
                return
            }
        }
        self.habitArray = []
    }
}
