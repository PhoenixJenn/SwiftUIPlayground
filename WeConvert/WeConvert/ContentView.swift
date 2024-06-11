//
//  ContentView.swift
//  WeConvert
//
//  Created by Jennifer Lee on 6/10/24.
//

/*:
 build an app that handles unit conversions: users will select an input unit and an output unit, then enter a value, and see the output of the conversion.

 Which units you choose are down to you, but you could choose one of these:
Choose Conversion Type:

conversionType: [Temp][Length][Time][Volume]

 --- for consistency, start with largest -> smallest
 
 Temp: Celsius, Fahrenheit
Distance: meters, kilometers <--> feet, yards, miles
 1 Miles = Meters / 1609.34708789
 100 centimeters or 1,000 millimeters
 conversion factor for meters to miles is 0.00062137119. This means that one meter is equal to approximately 0.00062137119 miles. To convert meters to miles, you simply multiply the number of meters by this conversion factor.
 A mile is equivalent to 1760yds or 5280ft.
 12" per foot
 KM:Miles
 Meters: Feet
 CM:Inches
 MM:Inches
 
 Parsecs: Miles
 1pc = 19173501441011 mi
 1pc = 30856800000000 km
 
 Kilometers = Parsecs * 30856800000000
 Miles = Parsecs * 19173501441011
 
 
 
Time: seconds, minutes, hours, days
LiquidVolume: milliliters, liters <--> cups, pints, or gallons.
 
 
 US gal lqd =L * 0.26417
 
 
 If you were going for length conversion you might have:
- A segmented control for meters, kilometers, feet, yard, or miles, for the input unit.
 - A second segmented control for meters, kilometers, feet, yard, or miles, for the output unit.
 - A text field where users enter a number.
 - A text view showing the result of the conversion.
 
 So, if you chose meters for source unit and feet for output unit, then entered 10, you’d see 32.81 as the output.
 */
import SwiftUI

struct ContentView: View {
    @State private var conversionType = "distance"
    @State private var amount : Double = 0.0
   
    let conversionTypes = ["distance", "time", "temp", "volume"]
    let distance  = ["miles","yards","feet","inches","kilometers","meters","centimeters","millimeters"]
    let time = ["days","hours","minutes","seconds"]
    let temp = ["Fahrenheit","Celsius"]
    let volume = ["gallons","pints","cups","liters","milliliters"]
    
    
    // dynamic assignment of starting units
    // dynamic assignment of ending units
    
    var body: some View {
        NavigationStack{
            // check splitting form
            Form{
                Section("Select type of measurement conversion:") {
                    Picker("Conversion", selection: $conversionType) {
                        ForEach(conversionTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .navigationTitle("weConvert")
                
                Section(){
                    // select starting units : based on conversionType variable
                    // select desired units : based on conversionType variable
                    // enter amount
                    
                    TextField("Amount", value: $amount, format: .number)
                }
                Section(){
                    // Result
                }
            } // /form
        }
    }
}

#Preview {
    ContentView()
}
