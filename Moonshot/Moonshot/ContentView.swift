//
//  ContentView.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/4/24.
//
// https://www.hackingwithswift.com/books/ios-swiftui/moonshot-introduction
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Text("Hello, world!")
            Image(.geek)
                .resizable()
                .scaledToFit() // ok to leave parts empty
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
               // .scaledToFill() // fill entire frame with photo even if some parts hang out
              //  .frame(width: 300, height: 300)
                
                //.clipped()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
