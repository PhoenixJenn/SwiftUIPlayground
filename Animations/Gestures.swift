//
//  Gestures.swift
//  Animations
//
//  Created by Jennifer Lee on 6/26/24.
//

import SwiftUI

struct Gestures: View {
    
    @State private var dragAmount = CGSize.zero
    
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 300, height: 200)
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                            .onEnded { _ in
                                
                                withAnimation(.bouncy) {
                                        dragAmount = .zero
                                    }
                               
                            }
                    )
                 //   .animation(.bouncy, value: dragAmount)
    }
}

#Preview {
    Gestures()
}
