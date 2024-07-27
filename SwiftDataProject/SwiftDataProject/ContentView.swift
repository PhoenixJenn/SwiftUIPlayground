//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Jennifer Lee on 7/19/24.
// https://www.hackingwithswift.com/books/ios-swiftui/dynamically-sorting-and-filtering-query-with-swiftui https://www.hackingwithswift.com/books/ios-swiftui/relationships-with-swiftdata-swiftui-and-query
//https://www.hackingwithswift.com/books/ios-swiftui/syncing-swiftdata-with-cloudkit 

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showingUpcomingOnly = false
    @Environment(\.modelContext) var modelContext
    @State private var path = [User]()
    
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate),
    ]
    
    // only capital R
   // @Query(sort: \User.name) var users: [User]
//    @Query(filter: #Predicate<User> { user in
//        user.name.contains("R")
//    }, sort: \User.name) var users: [User]
    
    //includes any letter R
//    @Query(filter: #Predicate<User> { user in
//        user.name.localizedStandardContains("R")
//    }, sort: \User.name) var users: [User]
    
    
//    @Query(filter: #Predicate<User> { user in
//        user.name.localizedStandardContains("R") &&
//        user.city == "London"
//    }, sort: \User.name) var users: [User]
    
    
    
    
    var body: some View {
        
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
//            List(users) { user in
//                Text(user.name)
//            }
            
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    
                    // clear all data 
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcomingOnly.toggle()
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    // current picker code
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate),
                            ])

                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
               
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
