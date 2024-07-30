//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Jennifer Lee on 7/30/24.
// Project 18  https://www.hackingwithswift.com/books/ios-swiftui/layout-and-geometry-introduction


import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
                   VStack {
                       Text("@phoenixjenn")
                       Image(.jennGitHub)
                           .resizable()
                           .frame(width: 64, height: 64)
                   }

                   VStack {
                       Text("Full name:")
                       Text("Jenn Lee")
                           .font(.largeTitle)
                   }
               }
        Divider()
        
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image(.jennGitHub)
                    .resizable()
                    .frame(width: 64, height: 64)
            }

            VStack {
                Text("Full name:")
                Text("Jenn Lee 2")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

#Preview {
    ContentView()
}
