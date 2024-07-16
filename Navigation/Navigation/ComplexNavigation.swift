//
//  ComplexNavigation.swift
//  Navigation
//
//  Created by Jennifer Lee on 7/16/24.
//

import SwiftUI

struct ComplexNavigation: View {

    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            Button("Go to view 2") {
                path.append("View2")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            
            .navigationDestination(for: String.self) { route in
                switch route {
                case "View2":
                    View2(path: $path)
                case "View3":
                    View3(path: $path)
                default:
                    View2(path: $path)
                }
                
            }
        }
    }
}

struct View2: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        Button("Go to view 3") {
            path.append("View3")
        }
        .padding()
        .background(Color.orange)
    }
}

struct View3: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var path: NavigationPath
    
    var body: some View {
        Button("Pop view") {
            path.removeLast()
            
            // or - call `dismiss()`
            // dismiss()
        }
        .padding()
        .background(Color.green)
    }
}
#Preview {
    ComplexNavigation()
}
