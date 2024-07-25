//
//  SampleView.swift
//  Instafilter
//
//  Created by Jennifer Lee on 7/24/24.
//

import SwiftUI

struct SampleView: View {
    @State private var blurAmount = 0.0
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
       var body: some View {
           VStack {
               Text("Hello, World!")
                   .blur(radius: blurAmount)

               Slider(value: $blurAmount, in: 0...20)
                   .onChange(of: blurAmount) { oldValue, newValue in
                       print("New value is \(newValue)")
                   }

               Button("Random Blur") {
                   blurAmount = Double.random(in: 0...20)
               }
               Spacer()
               Divider()
               Button("Hello, World!") {
                       showingConfirmation = true
                   }
                   .frame(width: 300, height: 300)
                   .background(backgroundColor)
                   .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                       Button("Red") { backgroundColor = .red }
                       Button("Green") { backgroundColor = .green }
                       Button("Blue") { backgroundColor = .blue }
                       Button("Cancel", role: .cancel) { }
                   } message: {
                       Text("Select a new color")
                   }
           }
       }
}

#Preview {
    SampleView()
}
