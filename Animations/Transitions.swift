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
       
                VStack {
                    Button("Tap Me") {
                        withAnimation {
                            isShowingRed.toggle()
                        }
                    }

                    if isShowingRed {
                        Rectangle()
                            .fill(.red)
                            .frame(width: 200, height: 200)
                            .transition(.asymmetric(insertion: .scale, removal: .opacity))
                            //.transition(.scale)
                    }
                }
    }
}

#Preview {
    Transitions()
}
