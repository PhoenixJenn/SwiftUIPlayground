//
//  AddHabit.swift
//  HabitTracker
//
//  Created by Jennifer Lee on 7/10/24.
//

import SwiftUI

struct AddHabit: View {
    @State private var name = ""
    @State private var description = ""
    //@State private var counter = 0
    
    
    @Environment(\.dismiss) var dismiss
    
    var habits: Habits
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                //TextField("Count", text: $counter)
            }
            .navigationTitle("Add new Habit")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        let item = Habit(name: name, description: description, counter: 7)
                        habits.items.append(item)
                        dismiss()
                    }
                    
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            } // toolbar
        } // navigation stack
    }
}

#Preview {
    AddHabit( habits:Habits() )
}
