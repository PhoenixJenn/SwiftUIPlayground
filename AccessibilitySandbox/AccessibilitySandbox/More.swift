//
//  More.swift
//  AccessibilitySandbox
//
//  Created by Jennifer Lee on 7/26/24.
//

import SwiftUI

struct More: View {
    
    @State private var value = 10
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        VStack {
                   Text("Value: \(value)")

                   Button("Increment") {
                       value += 1
                   }

                   Button("Decrement") {
                       value -= 1
                   }
               }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled.")
            }
        }
    }
}

#Preview {
    More()
}
