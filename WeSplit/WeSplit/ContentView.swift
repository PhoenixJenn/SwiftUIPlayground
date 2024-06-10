//
//  ContentView.swift
//  WeSplit
//
//  Created by Jennifer Lee on 6/10/24.
// Command + R   will run the simulator
// Day 16 https://www.hackingwithswift.com/100/swiftui/16
// "views are a function of their state"
// buttons, date pickers, etc documentation https://developer.apple.com/documentation/swiftui/button

import SwiftUI



struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
   
    let tipPercentages = [10,15,20, 25, 0]
 
    var totalWithTip: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
       return grandTotal
    }
    var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson  = totalWithTip / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack{
            // check splitting form
            Form{
                Section("Enter check amount") {
                    //Text("Enter check amount")
                    // 'amount' is placeholder text; value is binding property
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<20) {
                                Text("\($0) people")
                            }
                        }
                    //.pickerStyle(.navigationLink)
                    //navigationLink will slide the view to the right to select the num people
                }
              
                Section("How much tip do you want to leave?") {
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total Tip Amount / Per Person"){
                  
                    Text(totalWithTip, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                    Text(totalPerPerson, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                }
                
            } // form
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
   
    }
}


#Preview {
    ContentView()
}
