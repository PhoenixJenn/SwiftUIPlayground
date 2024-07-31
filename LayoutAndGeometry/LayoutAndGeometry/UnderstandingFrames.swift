//
//  UnderstandingFrames.swift
//  LayoutAndGeometry
//
//  Created by Jennifer Lee on 7/30/24.
//

import SwiftUI

struct UnderstandingFrames: View {
    var body: some View {
        OuterView()
                    .background(.red)
                    .coordinateSpace(name: "Custom")
        // Parent proposes size for child
        // child uses that
        // parent uses that to position child
        
//        GeometryReader { proxy in
//                    Text("Hello, World!")
//                        .frame(width: proxy.size.width * 0.9)
//                        .background(.red)
//                }
        
//        VStack {
//                    GeometryReader { proxy in
//                        Text("Hello, World!")
//                            .frame(width: proxy.size.width * 0.9, height: 40)
//                            .background(.red)
//                    }
//                    .background(.green)
//
//                    Text("More text")
//                        .background(.blue)
//                }
        
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    UnderstandingFrames()
}
struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                        print("Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)")
                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}
