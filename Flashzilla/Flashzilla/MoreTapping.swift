//
//  MoreTapping.swift
//  Flashzilla
//
//  Created by Jennifer Lee on 7/29/24.
//
// day 86
// https://www.hackingwithswift.com/100/swiftui/86

import SwiftUI

struct MoreTapping: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }

            // taps circle but not in rectangle space; ignores empty space
//            Circle()
//                .fill(.red)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Circle tapped!")
//                }
            
            //taps rectangle
//            Circle()
//                .fill(.orange)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Circle tapped!")
//                }
//                .allowsHitTesting(false)
            
            
            Circle()
                .fill(.green)
                .frame(width: 300, height: 300)
                .contentShape(.rect)
                .onTapGesture {
                    print("Circle tapped!")
                }
            
            
//            VStack {
//                Text("Hello")
//                Spacer().frame(height: 100)
//                Text("World")
//            }
//            .onTapGesture {
//                print("VStack tapped!")
//            }
            
            // allows for tapping in space
            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
            .contentShape(.rect)
            .onTapGesture {
                print("VStack HW tapped!")
            }
            
        }
    }
}

#Preview {
    MoreTapping()
}
