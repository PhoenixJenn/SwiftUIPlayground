//
//  ContentView.swift
//  WeConvert
//
//  Created by Jennifer Lee on 6/10/24.
// https://www.hackingwithswift.com/100/swiftui/19

/*:
OPEN QUESTIONS:
 How to print to console or show the value in variables for debug?
 
 TODO: Finish temp and volume converters
 TODO: Validate input for amount. Should I use guard let?
 TODO: return string instead of double for Converted Value; someDouble.formatted()
 TODO: How do i set the value of convertFrom/convertTo when the arrays are set?
 
 
 Advanced Picker project
 https://smehta.medium.com/ios-swift-creating-a-dynamic-picker-view-843b3290e7f0
 
 */
import SwiftUI

struct ContentView: View {
    @State private var selectedConversionType = "distance" // can use 0 here for index
    @State private var convertFrom = ""  // dynamic assignment of starting units
    @State private var convertTo = "" // dynamic assignment of ending units
    @State private var inputValue : Double = 0.0
    @State private var baselineAmount : Double = 0.0
   
   
    let conversionTypes = ["distance", "time", "temp", "volume"]
    let distance : [String]  = ["miles","yards","feet","inches","kilometers","meters","centimeters","millimeters"]
    let time = ["days","hours","minutes","seconds"]
    let temp = ["Celsius", "Fahrenheit", "Kelvin"]
    let volume = ["gallons", "quarts", "pints","cups", "liters", "milliliters"]
    
    // runs when selects a conversion from segemented top
    var selectedUnits: [String] {
    
        switch selectedConversionType {
            case "distance":
                return distance
            case "time":
                return time
            case "temp":
                return temp
            case "volume":
                return volume
            default:
                return distance
        }

    }
    
    // runs when inputValue changes
    // what if we return a string?
    //    var convertedValue: String {
    //        guard let value = Double(inputValue) else { return "Invalid Input" }
    //        return String(format: "%.2f", convert(value: value, from: selectedFromUnit, to: selectedToUnit, type: selectedConversionType))
    //    }
    
    
    var convertedValue : Double {
        var newAmount : Double = 0.0
        
        // TODO: make sure you test for valid input
        //guard let inputValue = Double(inputValue) else { return "Invalid Input" }
    
       // need to make sure there is a number in here...
        
        if !inputValue.isNaN && inputValue > 0 {
            // convert
            switch selectedConversionType {
                case "distance":
                    
                    return convertDistance()
                case "time":
                    return convertTime()
                case "temp":
                    return  convertTemp()
                case "volume":
                    return  convertVolume()
                default:
                    newAmount =  0.0
            }
        } // TODO: deal with the edge case of alpha/negative numbers
        else {
            newAmount = -42
        }
        return newAmount
        //String(format: "%.2f", newAmount)
        //return String(format: "%.2f", convert(value: value, from: selectedFromUnit, to: selectedToUnit, type: selectedConversionType))
        //return inputValue
    }
  
    func convertVolume() -> Double {
//    LiquidVolume: milliliters, liters <--> cups, pints, or gallons.
//     US gal lqd =L * 0.26417
        return 0.0
    }
    
    func convertTemp() -> Double {
        // can probably pass in a tuple here
        // Temp: Celsius, Fahrenheit
        // C->F : (x C × 9/5) + 32 = 32 F
        // F -> C : (x F − 32) × 5/9 = -17.78 C
        // C -> K : x C + 273.15 = 278.15K
        // F -> K : (x F − 32) × 5/9 + 273.15 = 258.15K

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
                    convertedTime = inputValue * hoursInDay * minutesInHour * secondsInMinute
            case "hours" :
                    convertedTime = inputValue * minutesInHour * secondsInMinute
            case "minutes" :
                    convertedTime = inputValue * secondsInMinute
            case "seconds" :
                    convertedTime = inputValue
            default:
                    return inputValue * hoursInDay * minutesInHour * secondsInMinute
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
                return convertedTime/secondsInMinute/minutesInHour/hoursInDay
        }
        return convertedTime
    }
    
    // can simplify using divide by and multiply by
    func convertDistance () ->  Double {
        // convert to inches, regardless of system
        
//        Parsecs: Miles
//        1pc = 19173501441011 mi
//        1pc = 30856800000000 km
//        
//        Kilometers = Parsecs * 30856800000000
//        Miles = Parsecs * 19173501441011
        
        
        var convertedDistance = inputValue
        
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
        
//        var convertedValue: String {
//              guard let value = Double(inputValue) else { return "Invalid Input" }
//              return String(format: "%.2f", convert(value: value, from: selectedFromUnit, to: selectedToUnit, type: selectedConversionType))
//          }
        
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
            
            // print out the baseline metric ??
            
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
                convertedDistance = inputValue // miles / miles
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

    
    var body: some View {
       
        
        NavigationStack{
            // check splitting form
            Form{
                Section("Select Conversion Type:") {
                    Picker("Conversion", selection: $selectedConversionType) {
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
                        ForEach(selectedUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
              
                
                Section("Select desired unit type:"){
                    // select desired units : based on conversionType variable
                    Picker("Convert to:", selection: $convertTo) {
                        ForEach(selectedUnits, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Enter amount:"){
                    // enter amount
                    TextField("Amount", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Converted Value"){
                    // Result
                    Text(convertFrom)
                    Text(convertTo)
                    Text(convertedValue, format: .number)
                   
//                    TextField("Baseline Amount", value: $baselineAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                        .keyboardType(.decimalPad)
//                        .focused($amountIsFocused)
                }
              
            } // /form
        }
    }
}

#Preview {
    ContentView()
}
