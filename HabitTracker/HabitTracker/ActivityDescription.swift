//
//  ActivityDescription.swift
//  HabitTracker
//
//  Created by Jennifer Lee on 7/10/24.
//

import SwiftUI

struct ActivityDescription: View {
    // let activityID : Int
    var habit : Habit
    var body: some View {
        
        HStack {
                    VStack(alignment: .leading) {
                        Text(habit.name)
                            .font(.headline)
                        Text(habit.description)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Text("\(habit.counter)")
                        .font(.largeTitle)
        }
        .padding()
        
    }
}

#Preview {
    ActivityDescription(habit: Habit(name: "Workout", description: "Getting fitter every day"))
}
