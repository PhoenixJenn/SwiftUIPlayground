//
//  ContentView.swift
//  Bookworm
//
//  Created by Jennifer Lee on 7/16/24.
//

import SwiftUI
import SwiftData


/*:
 TO DO:
 
 This was the last part of the overview for this project,
 so please go ahead and reset your project ready for the real work to begin.
 
 That means resetting ContentView.swift, BookwormApp.swift, and also deleting Student.swift.
 
 */
struct ContentView: View {
    @Query var students: [Student]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            NavigationStack {
                Text("Students")
                List(students) { student in
                    Text(student.name)
                }
                .navigationTitle("Classroom")
                .toolbar {
                    Button("Add") {
                        let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                        let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                        let chosenFirstName = firstNames.randomElement()!
                        let chosenLastName = lastNames.randomElement()!

                        let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                        modelContext.insert(student)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
