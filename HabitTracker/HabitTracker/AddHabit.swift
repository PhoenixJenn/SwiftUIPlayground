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
    
    //var habit: Habit // habit variable must contain a struct
    
    @ObservedObject var habits : Habits
    
    var body: some View {
        
        NavigationView {
            
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                //TextField("Count", text: $counter)
            }
            .navigationTitle("Add new Habit")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        let habit = Habit(name: name, description: description, counter: 0)
                        //self.habits.habits.append(habit)
                        habits.habitArray.append(habit)
                        //habits.habits.append(habit)
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
    AddHabit( habits: Habits() )
}
