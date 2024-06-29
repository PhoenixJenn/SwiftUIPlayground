//
//  Transitions.swift
//  Animations
//
//  Created by Jennifer Lee on 6/26/24.
//
// https://www.hackingwithswift.com/books/ios-swiftui/showing-and-hiding-views-with-transitions

import SwiftUI

struct Transitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
       
        ZStack {
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 200, height: 200)

                    if isShowingRed {
                        Rectangle()
                            .fill(.red)
                            .frame(width: 200, height: 200)
                            .transition(.pivot)
                    }
                }
                .onTapGesture {
                    withAnimation {
                        isShowingRed.toggle()
                    }
                }
        
        
                VStack {
                    Button("Tap Me") {
//                        withAnimation {
//                            isShowingRed.toggle()
//                        }
                    }

                    
                    
                    
//                    if isShowingRed {
//                        Rectangle()
//                            .fill(.red)
//                            .frame(width: 200, height: 200)
//                            .transition(.asymmetric(insertion: .scale, removal: .opacity))
//                            .transition(.pivot)
//                            //.transition(.scale)
//                    }
                } // vstack
                .onTapGesture {
                            withAnimation {
                                isShowingRed.toggle()
                            }
                        }
        
               
                
    }
}

#Preview {
    Transitions()
}


struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
