//
//  Accessibility.swift
//  Flashzilla
//
//  Created by Jennifer Lee on 7/30/24.
//

import SwiftUI

struct Accessibility: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
       @State private var scale = 1.0
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    var body: some View {
        Button("Hello, World!") {
                    if reduceMotion {
                        scale *= 1.5
                    } else {
                        withAnimation {
                            scale *= 1.5
                        }
                    }

                }
                .scaleEffect(scale)
        
        Button("Hello, World!") {
                    withOptionalAnimation {
                        scale *= 1.5
                    }

                }
                .scaleEffect(scale)
        
        HStack {
                    if differentiateWithoutColor {
                        Image(systemName: "checkmark.circle")
                    }

                    Text("Success")
                }
                .padding()
                .background(differentiateWithoutColor ? .black : .green)
                .foregroundStyle(.white)
                .clipShape(.capsule)
       
        
        
    }

    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

#Preview {
    Accessibility()
}
