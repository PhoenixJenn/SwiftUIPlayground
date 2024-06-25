//
//  AnimationPlayground.swift
//  Animations
//
//  Created by Jennifer Lee on 6/25/24.
//

import SwiftUI

struct AnimationPlayground: View {
     
        @State private var animationAmount = 1.0
        @State private var animationAmount2 = 1.0
        
        var body: some View {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Button("Tap Me Too") {
                            animationAmount2 += 1
                        }
                        .padding(50)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.circle)
                        .scaleEffect(animationAmount2)
                        .animation(
                            .easeInOut(duration: 1)
                                .repeatCount(3, autoreverses: true),
                            value: animationAmount2
                        )
                //.repeatCount(3, autoreverses: true),
                //.repeatForever(autoreverses: true),
                //.delay(1),
                    //we’re actually creating an instance of an Animation struct that has its own set of modifiers. So, we can attach modifiers directly to the animation to add a delay
                
                
                
                Button("Tap Me") {
                    // animationAmount += 1
                }
                .padding(50)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .stroke(.red)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeInOut(duration: 1)
                                .repeatForever(autoreverses: false),
                            value: animationAmount
                        )
                )
                .onAppear {
                    animationAmount = 2
                }
                
                
                
                Spacer()
                Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(50)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationAmount)
                //.blur(radius: (animationAmount - 1) * 3)
                .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount) // more bounce
                //.animation(.default, value: animationAmount)
                //.animation(.linear, value: animationAmount)
                //.animation(.default, value: animationAmount)
                
            }
            .padding()
        }
        
       
        
        
        
    
}

#Preview {
    AnimationPlayground()
}
