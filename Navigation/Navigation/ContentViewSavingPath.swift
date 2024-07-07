//
//  ContentViewSavingPath.swift
//  Navigation
//
//  Created by Jennifer Lee on 7/7/24.
//

import SwiftUI

struct ContentViewSavingPath: View {
    @State private var pathStore = PathStore()

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView3(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView3(number: i)
                }
        }
    }
}

struct DetailView3: View {
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}



#Preview {
    ContentViewSavingPath()
}
