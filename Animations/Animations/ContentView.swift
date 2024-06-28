//
//  ContentView.swift
//  Animations
//
//  Created by Jennifer Lee on 6/25/24.
//
// concept one: modifier order matters, because SwiftUI wraps views with modifiers in the order they are applied.
//Concept two:  we can apply an animation() modifier to a view in order to have it implicitly animate changes.

// TODO: Turn this into a more cohesive demo of gestures and animations
// TODO: create a nav 

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var animationSkewAmount = 0.0
    
    var body: some View {
        
       // print(animationAmount)

        //return VStack {
            VStack {
            Spacer()
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                            animationAmount += 1
                        }
                        .padding(40)
                        .background(.red)
                        .foregroundStyle(.white)
                        .clipShape(.circle)
                        .scaleEffect(animationAmount)

            
            Button("Tap Me2") {
                        withAnimation(.spring(duration: 1, bounce: 0.5)) {
                            animationSkewAmount += 360
                        }
                    }
                    .padding(50)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.circle)
                    .rotation3DEffect(.degrees(animationSkewAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
}

#Preview {
    ContentView()
}
