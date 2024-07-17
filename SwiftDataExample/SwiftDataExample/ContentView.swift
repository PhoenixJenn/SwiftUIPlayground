//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by Jennifer Lee on 7/17/24.
//

import SwiftUI
import SwiftData


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
