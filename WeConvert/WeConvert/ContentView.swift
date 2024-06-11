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

 
 Parsecs: Miles
 1pc = 19173501441011 mi
 1pc = 30856800000000 km
 
 Kilometers = Parsecs * 30856800000000
 Miles = Parsecs * 19173501441011
 
 
 
Time: seconds, minutes, hours, days
LiquidVolume: milliliters, liters <--> cups, pints, or gallons.
 
 
 US gal lqd =L * 0.26417
 
  the easiest way to store your conversion units is to have a simple string array, which you can loop over using something like ForEach(units, id: \.self).
 
 If you were going for length conversion you might have:
- A segmented control for meters, kilometers, feet, yard, or miles, for the input unit.
 - A second segmented control for meters, kilometers, feet, yard, or miles, for the output unit.
 - A text field where users enter a number.
 - A text view showing the result of the conversion.
 
 So, if you chose meters for source unit and feet for output unit, then entered 10, you’d see 32.81 as the output.
 
 Advanced Picker project
 https://smehta.medium.com/ios-swift-creating-a-dynamic-picker-view-843b3290e7f0
 
 */
import SwiftUI

struct ContentView: View {
    @State private var conversionType = "distance"
    @State private var convertFrom = ""  // dynamic assignment of starting units
    @State private var convertTo = "" // dynamic assignment of ending units
    @State private var amount : Double = 0.0
   // @State private var myMessage : String = ""
   
   
    let conversionTypes = ["distance", "time", "temp", "volume"]
    let distance : [String]  = ["","miles","yards","feet","inches","kilometers","meters","centimeters","millimeters"]
    let time = ["days","hours","minutes","seconds"]
    let temp = ["Fahrenheit","Celsius"]
    let volume = ["gallons","pints","cups","liters","milliliters"]
    
    
    
    
    // runs when selects a conversion from segemented top
    var typeArray: [String] {
        var selectedArray : [String] = [""]
        switch conversionType {
            case "distance":
                selectedArray = distance
            case "time":
                selectedArray = time
            case "temp":
                selectedArray = temp
            case "volume":
                selectedArray = volume
            default:
                selectedArray = distance
        }
       return selectedArray
    }
    
    // runs when amount changes
    var convertedAmount : Double {
        var newAmount : Double = 0.0
        if amount > 0 {
            // convert
            switch conversionType {
                case "distance":
                    newAmount = convertDistance()
                case "time":
                    newAmount = convertTime()
                case "temp" :
                    newAmount = convertTemp()
                case "volume" :
                    newAmount = convertVolume()
                default:
                    newAmount = 0.0
            }
            
            // TODO: deal with the edge case of negative numbers
            return newAmount
        }
        return amount
    }
  
    func convertVolume() -> Double {
        
        return 0.0
    }
    
    func convertTemp() -> Double {
        
        return 0.0
    }
    
    func convertTime () -> Double {
        var convertedTime = 0.0
        
        let secondsInMinute : Double = 60
        let minutesInHour : Double = 60
        let hoursInDay : Double = 24
        
        // convert to seconds
        switch convertFrom {
            case "days":
                    convertedTime = amount * hoursInDay * minutesInHour * secondsInMinute
            case "hours" :
                    convertedTime = amount * minutesInHour * secondsInMinute
            case "minutes" :
                    convertedTime = amount * secondsInMinute
            case "seconds" :
                    convertedTime = amount
            default:
                    return amount
        }
        
        switch convertTo {
            case "days" :
                    convertedTime = convertedTime/secondsInMinute/minutesInHour/hoursInDay
            case "hours" :
                    convertedTime *= secondsInMinute * minutesInHour
            case "minutes" :
                    convertedTime *= secondsInMinute
            case "seconds" :
                    convertedTime *= 1
            default:
                return amount
        }
        return convertedTime
    }
    
    // can simplify using divide by and multiply by
    func convertDistance () ->  Double {
        // convert to inches, regardless of system
        
        var convertedDistance = amount
        
        let inchesInFoot : Double = 12
        let feetInYard : Double = 3
        let yardsInMile : Double = 1760
        
        let mmInCM : Double = 10
        let cmInMeter : Double = 100
        let meterInKM : Double = 1000
        
        let inchesToMM : Double =  25.4
 //multiply the inch value by 25.4
        //Metric to Imperial
        let mmToInches : Double = 0.0393701 //divide mm value by 25.4
        
        //         1 Miles = Meters / 1609.34708789
        //         .  multiply the number of meters by this .
        
        // convert to smallet denominator, inches or mm then multiply
        switch convertFrom {
            // convert everything to inches
            case "miles":
                // 1 mile is equivalent to 1760yds or 5280ft or 63.360 inches
                // 12"/foot x 3 ft /yard x 1760 yards
                // convert to inches
                convertedDistance *= inchesInFoot * feetInYard * yardsInMile
            case "yards":
                convertedDistance *= inchesInFoot * feetInYard
            case "feet":
                convertedDistance *= inchesInFoot
            case "inches":
                convertedDistance *= 1
            
            // converts back to metric : should take inches and conver to mm
            // multiply by 25.4
            case "kilometers":
                convertedDistance *=  meterInKM * cmInMeter * mmInCM * mmToInches
            case "meters":
                convertedDistance *= cmInMeter * mmInCM * mmToInches
            case "centimeters":
                convertedDistance *= mmInCM * mmToInches
            case "millimeters":
                convertedDistance /=  mmToInches
            default:
                convertedDistance = amount
            }

        //Imperial to Metric : CONVERT inches to -----------
        
        switch convertTo {
            case "miles":
                convertedDistance /= (inchesInFoot * feetInYard * yardsInMile)
            case "yards":
                convertedDistance /= (inchesInFoot * feetInYard )
            case "feet":
                convertedDistance /= inchesInFoot  //convertedDistance/(inchesInFoot)
            case "inches":
                convertedDistance *= 1
            
            case "millimeters":
                convertedDistance *= inchesToMM
            case "centimeters":
                convertedDistance *= inchesToMM
                convertedDistance /= mmInCM
            case "meters":
                convertedDistance *= inchesToMM
                convertedDistance /= (mmInCM * cmInMeter)
            case "kilometers":
                convertedDistance *= inchesToMM
                convertedDistance /= (mmInCM * cmInMeter * meterInKM)
            
            default:
                convertedDistance /= inchesInFoot
        }
        return convertedDistance
    }
    
    /*:
     https://stackoverflow.com/questions/57518852/swiftui-picker-onchange-or-equivalent
     https://stackoverflow.com/questions/77100045/how-to-dynamically-populate-a-swiftui-picker-segmented-control
     ForEach(Array(colors.enumerated()), id: \.element) { index, color in
         Text(color).tag(index)
     }
     */
    
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
                    // .onChange(of: conversionType) { tag in print("Selected: \(tag)") }
                }
                .navigationTitle("weConvert")
                
               
                
                Section("Select starting unit type:"){
                    // select starting units : based on conversionType variable
                   
                    Picker("Convert from:", selection: $convertFrom) {
                        ForEach(typeArray, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                Section("Select desired unit type:"){
                    // select desired units : based on conversionType variable
                    Picker("Convert to:", selection: $convertTo) {
                        ForEach(typeArray, id: \.self) {
                            Text($0)
                        }
                    }
                    //.pickerStyle(WheelPickerStyle())
                }
                Section("Enter amount:"){
                    // enter amount
                    TextField("Amount", value: $amount, format: .number)
                }
                Section("Converted to x"){
                    // Result
                    Text(convertFrom)
                    Text(convertTo)
                    Text(convertedAmount, format: .number)
                }
            } // /form
        }
    }
}

#Preview {
    ContentView()
}
