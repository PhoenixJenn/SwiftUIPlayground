//
//  Tabs.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
// https://www.hackingwithswift.com/100/swiftui/79

import SwiftUI

struct Tabs: View {
    @State private var selectedTab = "One"
/*:
 Tip: It’s common to want to use NavigationStack and TabView at the same time, but you should be careful: TabView should be the parent view, with the tabs inside it having a NavigationStack as necessary, rather than the other way around.
 */
        var body: some View {
            TabView(selection: $selectedTab) {
                Button("Show Tab 2") {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")

                Text("Tab 2")
                    .tabItem {
                        Label("Two", systemImage: "circle")
                    }
                    .tag("Two")
            }
        }
}

#Preview {
    Tabs()
}
