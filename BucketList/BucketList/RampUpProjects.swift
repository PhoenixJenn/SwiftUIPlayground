//
//  RampUpProjects.swift
//  BucketList
//
//  Created by Jennifer Lee on 7/25/24.
//

import SwiftUI
import Foundation
struct RampUpProjects: View {
    let users = [
            User(firstName: "Arnold", lastName: "Rimmer"),
            User(firstName: "Kristine", lastName: "Kochanski"),
            User(firstName: "David", lastName: "Lister"),
        ].sorted()
    // don't sort here
//        .sorted(){
//            $0.lastName < $1.lastName
//        }
    
        let values = [1, 5, 3, 6, 2, 9].sorted()

           var body: some View {
               //print(URL.documentsDirectory)
               List(values, id: \.self) {
                   Text(String($0))
               }
               List(users) { user in
                           Text("\(user.lastName), \(user.firstName)")
                       }
           }
    
     
}

#Preview {
    RampUpProjects()
}
//we made the User struct conform to Identifiable.
// One thing you can’t see in that code is that conforming to Comparable also gives us access to the > operator – greater than. This is the opposite of <, so Swift creates it for us by using < and flipping the Boolean between true and false.
struct User: Identifiable, Comparable  {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
            lhs.lastName < rhs.lastName
        }
}
