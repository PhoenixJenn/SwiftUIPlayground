//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jennifer Lee on 7/10/24.
//
/*:

 REQUIREMENTS
 three levels to this app
 [x ]List of activities to track
 [x]Form to add new Activities (title, description)
 [x]Tapping activity shows description
 [x]detail screen contain how many times they have completed it,
 [x]plus a button incrementing their completion count
 [x]use Codable and UserDefaults to load and save all your data.
 
 [x] define a struct that holds a single activity
 [x] define a class that holds an array of activities.
 [x] The class will need to use the Observable macro so SwiftUI can monitor your data for changes
 [x] Your main listing and form should both be able to read the shared activities object.
 [x] Make sure your activity conforms to Identifiable to avoid problems.
 [x] Present your adding form using sheet(), and your activity detail view (if you add one) using NavigationLink. I recommend against using presentation values for your navigation – keep it simple here!
 
 
 Making the button to increment completion count will challenge you, because you need to modify the activity that was passed in. If you’re stuck, the easiest approach is this:

 [ ] Make your struct conform to Equatable. You don’t need anything special here – just add Equatable after Codable and Identifiable.
 [ ] Pass both the selected activity and the @Observable class into your detail view.
 [ ] When the increment button is tapped, copy the existing activity and add 1 to its completion count.
 [ ] Use firstIndex(of:) to find where the previous activity was in the class’s array, then change it to be your new activity – something like data.activities[index] = newActivity will work. (This requires the Equatable conformance from step 1!)
 
 // TODO: Read and Understand Binding and Observable https://gist.github.com/Ma-He/6b9ebff24061884fde8e2132692a9aa3
 // https://github.com/Deepesh22/Habit-Tracker/blob/master/HabitTracker/Habit.swift
 https://github.com/Deepesh22/Habit-Tracker/blob/master/HabitTracker/ContentView.swift
 //https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-stateobject-property-wrapper
 
 */
import SwiftUI
import Observation
import Foundation

struct ContentView: View {
   
    @ObservedObject var habits = Habits()
    
    @State private var showingAddHabit = false
    @State private var tally = 0
    
    //var activity: Habit
    
    var body: some View {
         
           
            
            
                // change this to view details somehow
                // put Navigation link IN the Foreach rather than at parent level
            NavigationView {
                
                List {
                    //ForEach(Array(array.enumerated()), id: \.offset) { index, element in
                    ForEach(Array(habits.habitArray.enumerated()), id: \.offset) { index, activity in
                        NavigationLink(destination: ActivityDescription(habit: $habits.habitArray[index])){
                            HStack{
//                                Image(systemName: "plus")
//                                    .background(Color.blue)
//                                    .foregroundColor(.white)
//                                    .clipShape(Circle())
                                Text("\(habits.habitArray[index].name)")
                               // Text("\(habits.habitArray[index].description)")
                                Text("\(habits.habitArray[index].counter)")
                            }
                            
                        }
                    }//foreach
                    .onDelete(perform: removeActivities)
                    Text("Activities Tracked: \(habits.habitArray.count)")
                        .foregroundColor(.red)
                }//list
                .sheet(isPresented: $showingAddHabit) {
                    AddHabit(habits: self.habits)
                }
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showingAddHabit = true
                    }) {
                        Image(systemName: "plus")
                    } 
  
                ).navigationTitle("Habit Tracker")
               // .preferredColorScheme(.dark)
            } //navigationview
            
            
 
    } //view
    
    func doNothing(id: UUID, counter: Int ){
        // do nothing
    }
    func removeActivities(at offsets: IndexSet) {
        habits.habitArray.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
