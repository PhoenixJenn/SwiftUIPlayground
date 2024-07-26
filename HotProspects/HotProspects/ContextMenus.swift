//
//  ContextMenus.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//
/*:
 
 If you’re going to use them, use them in lots of places – it can be frustrating to press and hold on something only to find nothing happens.
 Keep your list of options as short as you can – aim for three or less.
 Don’t repeat options the user can already see elsewhere in your UI.
 
 */

import SwiftUI

struct ContextMenus: View {
    @State private var backgroundColor = Color.red

    
    var body: some View {
        VStack {
                    Text("Hello, World!")
                        .padding()
                        .background(backgroundColor)

                    Text("Change Color") // press and hold
                        .padding()
                        .contextMenu {
//                            Button("Red", systemImage: "checkmark.circle.fill") {
//                                backgroundColor = .red
//                            }
                            Button("Red", systemImage: "checkmark.circle.fill", role: .destructive) {
                                backgroundColor = .red
                            }
                            Button("Green") {
                                backgroundColor = .green
                            }

                            Button("Blue") {
                                backgroundColor = .blue
                            }
                        }
                }
    }
}

#Preview {
    ContextMenus()
}
