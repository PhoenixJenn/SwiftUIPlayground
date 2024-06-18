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
    
    var body: some View {
        VStack {
            
            //constrains sleep to 4-12 hrs
//            Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12)
            
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
           
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
