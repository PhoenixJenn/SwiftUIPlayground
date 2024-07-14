//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Jennifer Lee on 7/13/24.
//

import SwiftUI

struct ActivityView: View {
    var activity: Habit
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(activity.name)
                    .font(.headline)
                Text(activity.description)
                    .font(.caption)
            }
            
            Spacer()
            
            Text("\(activity.counter)")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ActivityView(activity: Habit(name: "Water", description: "Hydration matters"))
}
