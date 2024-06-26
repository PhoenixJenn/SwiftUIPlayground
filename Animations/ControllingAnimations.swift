//
//  ControllingAnimations.swift
//  Animations
//
//  Created by Jennifer Lee on 6/26/24.
//

import SwiftUI

struct ControllingAnimations: View {
    
    @State private var enabled = false
    @State private var enabled1 = false
    @State private var enabled2 = false
    
    
    var body: some View {
        
        
        Button("Tap Me") {
            // do nothing
        }
        .background(.blue)
        .frame(width: 200, height: 200)
        .foregroundStyle(.white)
        
        // order matters; move clipshape before and after animation to see
        //SwiftUI wraps views with modifiers
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 150, height: 150)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.default, value: enabled)
      //  .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        
        
        
        
        
        Button("Tap Me") {
            enabled1.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled1 ? .blue : .green)
        .animation(.default, value: enabled1)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled1 ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled1)
        
        
        // it’s possible to disable animations entirely by passing nil to the modifier
        Button("Tap Me") {
            enabled2.toggle()
        }
        .frame(width: 150, height: 150)
        .background(enabled2 ? .blue : .yellow)
        .animation(nil, value: enabled2)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled2 ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled2)
        
    }
}

#Preview {
    ControllingAnimations()
}
