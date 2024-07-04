//
//  ScrollingGrid.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/4/24.
//

import SwiftUI

struct ScrollingGrid: View {
//    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
//    ]
//    
    
    // That tells SwiftUI we’re happy to fit in as many columns as possible, as long as they are at least 80 points in width but max 120
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        // LazyHGrid for showing horizontal data, and LazyVGrid for showing vertical data
        
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        } // scroll
        
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }

    }
}

#Preview {
    ScrollingGrid()
}
