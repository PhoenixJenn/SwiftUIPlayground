//
//  ContentView.swift
//  BetterRest
//
//  Created by Jennifer Lee on 6/17/24.
//

import SwiftUI
/*:
 
 When do they want to wake up?
 Roughly how many hours of sleep do they want?
 How many cups of coffee do they drink per day?
 */
struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    
    var body: some View {
        VStack {
            
            //constrains sleep to 4-12 hrs
//            Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12)
            Text("Better Rest!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            
            
           
            Text("Wake Up!")
            
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            // That will allow all dates in the future, but none in the past – read it as “from the current date up to anything.”
            
            
            
//            DatePicker("Please enter a date", selection: $wakeUp)
//                .labelsHidden()
            
            
            /*:
             https://www.hackingwithswift.com/books/ios-swiftui/selecting-dates-and-times-with-datepicker
             use displayedComponents to decide what kind of options users should see:

             If you don’t provide this parameter, users see a day, hour, and minute.
             If you use .date users see month, day, and year.
             If you use .hourAndMinute users see just the hour and minute components.
             */
//            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
            
            //That still includes the original label so screen readers can use it for VoiceOver, but now they aren’t visible onscreen any more – the date picker won’t be pushed to one side by some empty text.
            
        }
        .padding()
    }
    
    
    func exampleDates() {
        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400)

        // create a range from those two
        let range = Date.now...tomorrow
    }
    
}

#Preview {
    ContentView()
}
