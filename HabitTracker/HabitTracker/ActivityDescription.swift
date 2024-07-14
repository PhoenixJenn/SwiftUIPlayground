//
//  ActivityDescription.swift
//  HabitTracker
//
//  Created by Jennifer Lee on 7/10/24.
//

import SwiftUI

struct ActivityDescription: View {
    
    @Binding var habit: Habit
    //let habit : Habit
    
    var body: some View {
         
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(habit.name)
                            .font(.largeTitle)
                        Text(habit.description)
                            .font(.title)
                        
                        Spacer()
                        Divider()
                                //.frame(width: 80)
                                .padding(.vertical)
                        
                        VStack(alignment: .center) {
                            Text("\(habit.counter)")
                                .font(.largeTitle)
                                 
                        }
                        
                        Button(action: {
                                habit.incrementCounter()
                        }) {
                                HStack {
                                    Image(systemName: "plus")
                                        .font(.system(size: 24, weight: .medium))
                                    Text("Track Habit".uppercased())
                                        .font(.title)
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(12)
                            }
                           
                    }.padding()
        //divider
                    
    } //body view
} // struct

#Preview {
    ActivityDescription(habit: .constant(Habit(name: "Water", description: "Hydration matters")))
}
