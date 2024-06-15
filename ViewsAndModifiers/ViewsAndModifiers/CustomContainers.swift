//
//  CustomContainers.swift
//  ViewsAndModifiers
//
//  Created by Jennifer Lee on 6/15/24.
//
// https://www.hackingwithswift.com/books/ios-swiftui/custom-containers


import SwiftUI


struct CustomContainers: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Text("R\(row) C\(col)")
        }
        Text("-----------------")
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
       
        
        // implicit HStack now
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    //let content: (Int, Int) -> Content
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
                ForEach(0..<rows, id: \.self) { row in
                    HStack {
                        ForEach(0..<columns, id: \.self) { column in
                            content(row, column)
                        }
                    }
                }
            }
    }
}


#Preview {
    CustomContainers()
}
