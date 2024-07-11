//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jennifer Lee on 7/10/24.
//
/*:

 REQUIREMENTS
 three levels to this app
 [ ]List of activities to track
 [ ]Form to add new Activities (title, description)
 [ ]Tapping activity shows description
 [ ]detail screen contain how many times they have completed it,
 [ ]plus a button incrementing their completion count
 [ ]use Codable and UserDefaults to load and save all your data.
 
 [ ] define a struct that holds a single activity
 [ ] define a class that holds an array of activities.
 [ ] The class will need to use the Observable macro so SwiftUI can monitor your data for changes
 [ ]Your main listing and form should both be able to read the shared activities object.
 [ ] Make sure your activity conforms to Identifiable to avoid problems.
 [ ] Present your adding form using sheet(), and your activity detail view (if you add one) using NavigationLink. I recommend against using presentation values for your navigation – keep it simple here!
 
 
 Making the button to increment completion count will challenge you, because you need to modify the activity that was passed in. If you’re stuck, the easiest approach is this:

 [ ] Make your struct conform to Equatable. You don’t need anything special here – just add Equatable after Codable and Identifiable.
 [ ] Pass both the selected activity and the @Observable class into your detail view.
 [ ] When the increment button is tapped, copy the existing activity and add 1 to its completion count.
 [ ] Use firstIndex(of:) to find where the previous activity was in the class’s array, then change it to be your new activity – something like data.activities[index] = newActivity will work. (This requires the Equatable conformance from step 1!)
 */
import SwiftUI
import Observation

struct ContentView: View {
    
      @State private var habits = Habits()
      @State private var showingHabits = false
        @State private var tally = 0
    
    var body: some View {
        
        
        
                // change this to view details somehow
                // put Navigation link IN the Foreach rather than at parent level
            NavigationStack {
            
            NavigationLink("Add Item") {
                AddHabit(habits: habits)
            }
            List{
                
                    ForEach(habits.items) { item in
                        NavigationLink {
                            ActivityDescription(habit: item)
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.description)
                                }
                                Spacer()
                                Text("\(item.counter)") // ?? 0
                                    .font(.largeTitle)
                            }
                           // Text("\(item)")
//                            Stepper(label:" ", onIncrement: doNothing(), onDecrement: doNothing())
                            
//                            Button("",systemImage: "plus" ) {
//                                doNothing(id: item.id, counter: item.counter ?? 0)
//                                    }
//                            Stepper("^[\(item.counter) cup](inflect: true)", value: item.counter, in: 1...20)
                            //Stepper(value: item.counter)
                            /*:
                             Button("Tap count: \(tapCount)") {
                                         tapCount += 1
                                     }
                             UserDefaults.standard.set(tapCount, forKey: "Tap")

                             */
                        }
                        
                    } // foreach
                    .onDelete(perform: removeItems)
                } // list
                
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Toggle", systemImage: "plus"  ) {
                    //AddHabit(habits: habits)
                    showingHabits = true
                }
            }
        } // nav stack
        .sheet(isPresented: $showingHabits) {
            AddHabit(habits: habits)
        }
        
        Text("Habits Tracked: \(habits.items.count)")
    } // view
    
    
    func doNothing(id: UUID, counter: Int ){
        // do nothing
    }
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
