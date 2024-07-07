//
//  MultiNavDestTypes.swift
//  Navigation
//
//  Created by Jennifer Lee on 7/7/24.
//

import SwiftUI

struct MultiNavDestTypes: View {
    //If you want to feel fancy, NavigationPath is what we call a type-eraser – it stores any kind of Hashable data without exposing exactly what type of data each item is.
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }

                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            } // list
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }

                Button("Push Hello") {
                    path.append("Hello")
                }
            } // toolbar appends to List
        }
       

    }
}

#Preview {
    MultiNavDestTypes()
}
