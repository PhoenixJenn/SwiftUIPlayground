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
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var habits : HabitStorage
    
    var body: some View {
        
        NavigationView {
            
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new Habit")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        
                        let habit = Habit(name: name, description: description, counter: 0)
                       
                        habits.habitArray.append(habit)
                        
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
    AddHabit( habits: HabitStorage() )
}
