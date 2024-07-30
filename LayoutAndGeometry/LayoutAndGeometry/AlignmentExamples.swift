//
//  AlignmentExamples.swift
//  LayoutAndGeometry
//
//  Created by Jennifer Lee on 7/30/24.
//
// https://www.hackingwithswift.com/books/ios-swiftui/alignment-and-alignment-guides

import SwiftUI

struct AlignmentExamples: View {
    var body: some View {
        VStack(alignment: .leading) {
                ForEach(0..<10) { position in
                    Text("Number \(position)")
                        .alignmentGuide(.leading) { _ in Double(position) * -10 }
                }
            }
            .background(.red)
            .frame(width: 400, height: 400)
            .background(.blue)
        
        
//        Color.red
//
////        Text("Live long and prosper")
////            .frame(width: 300, height: 300, alignment: .topLeading)
//
//        VStack(alignment: .leading) {
//            Text("Hello, LEFT world!")
//                .alignmentGuide(.leading) { d in d[.leading] }
//            Text("This is a longer line of text")
//        }
//
//        VStack(alignment: .leading) {
//            Text("Hello, Great world!")
//                .alignmentGuide(.leading) { d in d[.trailing] }
//            Text("This is a longer line of text")
//        }
//
//        VStack(alignment: .leading) {
//                    Text("Hello, world!")
//                    Text("This is a longer line of text")
//                }
//                .background(.red)
//                .frame(width: 400, height: 400)
//                .background(.blue)
//
//
//
//        HStack (alignment: .lastTextBaseline){
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
//
//        VStack {
//
//                Text("Hello, World!")
//                .padding(20)
//                    .background(.red)
//
//            Text("Hello, World!")
//                .padding()
//                .background(.red)
//
//            Text("Hello, World!")
//                .background(.red)
//                .padding()
//
//        }
//        .padding()
    }
}

#Preview {
    AlignmentExamples()
}
