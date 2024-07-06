//
//  ScrollViewExamples.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/5/24.
//

import SwiftUI

struct ScrollViewExamples: View {
    var body: some View {
        VStack{
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 10) {
                                ForEach(0..<100) {
                                    CustomText("Item \($0)")
                                        .font(.title)
                                }
                            }
                        }
                    
                    VStack{
                        ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(0..<100) {
                                CustomText("Item \($0)")
                                        .font(.title)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    } // scrollview
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
    ScrollViewExamples()
}
