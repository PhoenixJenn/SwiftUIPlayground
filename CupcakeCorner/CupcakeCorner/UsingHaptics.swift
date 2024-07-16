//
//  UsingHaptics.swift
//  CupcakeCorner
//
//  Created by Jennifer Lee on 7/15/24.
//

// For more advanced haptics, Apple provides us with a whole framework called Core Haptics. Core Haptics lets us create hugely customizable haptics by combining taps, continuous vibrations, parameter curves, and more.

import SwiftUI
//import CoreHaptics
// https://www.hackingwithswift.com/books/ios-swiftui/adding-haptic-effects

struct UsingHaptics: View {
    // this crashes
    //@State private var engine: CHHapticEngine?
    @State private var counter = 0

        var body: some View {
            Button("Tap Count: \(counter)") {
                counter += 1
            }.sensoryFeedback(.increase, trigger: counter)
            /*:
             
             .increase is one of the built-in haptic feedback variants, and is best used when you're increasing a value such as a counter. There are lots of others to choose from, including .success, .warning, .error, .start, .stop, and more.
             */
        }
    
    /*:
     
     If you want a little more control over your haptic effects, there's an alternative called .impact(), which has two variants: one where you specify how flexible your object is and how strong the effect should be, and one where you specify a weight and intensity.

     For example, we could request a middling collision between two soft objects:
     //.sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
     Or we could specify an intense collision between two heavy objects:
     // .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
     */
    
}

#Preview {
    UsingHaptics()
}
