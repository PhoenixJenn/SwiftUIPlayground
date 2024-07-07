//
//  UsingNavigationDestinations.swift
//  Navigation
//
//  Created by Jennifer Lee on 7/7/24.
//

import SwiftUI

struct UsingNavigationDestinations: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }.navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    UsingNavigationDestinations()
}
