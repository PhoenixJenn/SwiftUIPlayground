//
//  UserDefaults.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/2/24.
//

// https://www.hackingwithswift.com/books/ios-swiftui/archiving-swift-objects-with-codable
// we want to archive a custom type so we can put it into UserDefaults, then unarchive it when it comes back out from UserDefaults.


import SwiftUI
import Foundation

// following examples and used user twice, so renaming
struct UserObject : Codable {
    
    let firstName: String
    let lastName: String
}

struct UserDefaults: View {
    @State private var user = UserObject(firstName: "Taylor", lastName: "Swift")
    
    @State private var tapCount = Foundation.UserDefaults.standard.integer(forKey: "Tap")
    
    
    
    func doNothing(){
        // do nothing
    }
    
    var body: some View {
      
        VStack{
            Button("Tap count: \(tapCount)") {
                tapCount += 1
                Foundation.UserDefaults.standard.set(tapCount, forKey: "Tap")
            }
            
            
            Button(action: doNothing) {
                Label("Add Folder", systemImage: "folder.badge.plus")
            }
            
            /*:
             
             When we’re coming back the other way – when we have JSON data and we want to convert it to Swift Codable types – we should use JSONDecoder rather than JSONEncoder(), but the process is much the same.
             */
            
            Button("Save User") {
                let encoder = JSONEncoder()

                if let data = try? encoder.encode(user) {
                    Foundation.UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
            
            
        }
        
    }
}

#Preview {
    UserDefaults()
}
