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
            Image(.geek)
                .resizable()
                .scaledToFit() // ok to leave parts empty
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
               // .scaledToFill() // fill entire frame with photo even if some parts hang out
              //  .frame(width: 300, height: 300)
                
                //.clipped()
        } // Vstack
        .padding()
        
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                            .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        } // scrollview
        
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
        }
    }
}

// this is a wrapper for our text view to demonstrate that w/out lazyVstack, it loads the whole set, which is wasteful
// with lazyVstack, it only creates CustomText views when needed
struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText \(text)")
        self.text = text
    }
}


#Preview {
    ContentView()
}
