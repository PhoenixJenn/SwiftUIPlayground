//
//  SampleView.swift
//  LayoutAndGeometry
//
//  Created by Jennifer Lee on 7/30/24.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
//        Text("Hello, world!")
//            .position(x: 100, y: 100)
//            .background(.red)
        
        VStack{
            Text("Hello, world!")
                .position(x: 100, y: 100)
                .background(.red)
            
            Text("hello")
        }
//        Text("Hello, world!")
//                .offset(x: 100, y: 100)
//                .background(.red)
        
//        Text("Hello, world!")
//            .background(.red)
//            .position(x: 100, y: 100)
        
        
    }
}

#Preview {
    SampleView()
}
