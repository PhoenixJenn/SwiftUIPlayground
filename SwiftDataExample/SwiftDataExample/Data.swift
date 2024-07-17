//
//  Data.swift
//  SwiftDataExample
//
//  Created by Jennifer Lee on 7/17/24.
//


/*:
 
 @Query:
 That looks like a regular Student array, but just adding @Query to the start is enough to make SwiftData loads students from its model container – it automatically finds the main context that was placed into the environment, and queries the container through there. We haven't specified which students to load, or how to sort the results, so we'll just get all of them.
 */
import Foundation
import SwiftUI
import SwiftData

struct Data: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    Data()
}

/*:
 We can turn that into a SwiftData object – something that it can save in its database, sync with iCloud, search, sort, and more – by making two very small changes.
 This class is called a SwiftData model
 */
//@Observable
@Model
class Student {
    
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
