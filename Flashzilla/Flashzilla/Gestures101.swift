//
//  Gestures101.swift
//  Flashzilla
//
//  Created by Jennifer Lee on 7/29/24.
//

import SwiftUI

struct Gestures101: View {
//    @State private var currentAmount = 0.0
//    @State private var finalAmount = 1.0
    
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    // how far the circle has been dragged
    @State private var offset = CGSize.zero

        // whether it is currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture(count: 2) {
                print("Double tapped!")
            }
        Spacer()
        Divider()
        Text("Hello, Long Press In Progress!")
            .onLongPressGesture(minimumDuration: 1) {
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                print("In progress: \(inProgress)!")
            }
        
        Spacer()
        Divider()
        
        //pinching in and out scales the view up and down.
//        Text("Hello, Third World!")
//                    .scaleEffect(finalAmount + currentAmount)
//                    .gesture(
//                        MagnifyGesture()
//                            .onChanged { value in
//                                currentAmount = value.magnification - 1
//                            }
//                            .onEnded { value in
//                                finalAmount += currentAmount
//                                currentAmount = 0
//                            }
//                    )
        Text(" Option Key and twist!")
                    .rotationEffect(currentAmount + finalAmount)
                     
                    .gesture(
                        RotateGesture()
                            .onChanged { value in
                                currentAmount = value.rotation
                            }
                            .onEnded { value in
                                finalAmount += currentAmount
                                currentAmount = .zero
                            }
                    )
        Spacer()
         
        VStack {
                    Text("Hello, TapPriority!")
                        .onTapGesture {
                            print("Text tapped")
                        }
                }
                .highPriorityGesture(
                    TapGesture()
                        .onEnded {
                            print("VStack tapped")
                        }
                )
        
        Spacer()
        
        VStack {
                    Text("Hello, Vstack!")
                        .onTapGesture {
                            print("Text tapped")
                        }
                }
                .simultaneousGesture(
                    TapGesture()
                        .onEnded {
                            print("VStack tapped")
                        }
                )
        
        Text("Click then select option and drag)")
        // a drag gesture that updates offset and isDragging as it moves around
                let dragGesture = DragGesture()
                    .onChanged { value in offset = value.translation }
                    .onEnded { _ in
                        withAnimation {
                            offset = .zero
                            isDragging = false
                        }
                    }

                // a long press gesture that enables isDragging
                let pressGesture = LongPressGesture()
                    .onEnded { value in
                        withAnimation {
                            isDragging = true
                        }
                    }

                // a combined gesture that forces the user to long press then drag
                let combined = pressGesture.sequenced(before: dragGesture)

                // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
                Circle()
                    .fill(.red)
                    .frame(width: 64, height: 64)
                    .scaleEffect(isDragging ? 1.5 : 1)
                    .offset(offset)
                    .gesture(combined)
            
        Spacer()

        
        
        
    }
}

#Preview {
    Gestures101()
}
