//
//  ContentView.swift
//  BetterRest
//
//  Created by Jennifer Lee on 6/17/24.
//
import CoreML
import SwiftUI

/*:
 
 When do they want to wake up?
 Roughly how many hours of sleep do they want?
 How many cups of coffee do they drink per day?
 https://www.hackingwithswift.com/books/ios-swiftui/connecting-swiftui-to-core-ml
 */
struct ContentView: View {
    
 
    
    @State private var wakeUp = defaultWakeTime //Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var components = DateComponents()
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }

    
 
       
    var body: some View {
        NavigationView {
            Form {
                // why won't this align left
                HStack{
                    Text("Today's Date")
                    Text(Date.now, format: .dateTime.day().month().year())
                }
                .frame(alignment: .trailing)
                
                
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading, spacing: 0)  {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                }
               

            } // end Form
            .alert(alertTitle, isPresented: $showingAlert){
                Button("ok"){}
                } message: {
                    Text(alertMessage)
                } // end alert
      
            
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
        }

        .padding()
    }
    
    
    
    func calculateBedtime() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp )
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0 ) * 60
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleeptTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleeptTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            
        }
        showingAlert = true
    }
    
    
//    func pickingDates(){
//     //   let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//        
//       // components.hour = 8
//       // components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
//     
//    }
//    func exampleDates() {
//        // create a second Date instance set to one day in seconds from now
//        let tomorrow = Date.now.addingTimeInterval(86400)
//
//        // create a range from those two
//        let range = Date.now...tomorrow
//    }
    
}

#Preview {
    ContentView()
}



//    Text(Date.now.formatted(date: .long, time: .shortened))
   
//            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//            Text("Wake Up!")
//
//            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
   // That will allow all dates in the future, but none in the past – read it as “from the current date up to anything.”
   
   
   // this is better for accessibility
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
//constrains sleep to 4-12 hrs
//            Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12)


