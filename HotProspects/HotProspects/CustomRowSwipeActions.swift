//
//  CustomRowSwipeActions.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
// https://www.hackingwithswift.com/books/ios-swiftui/adding-custom-row-swipe-actions-to-a-list

import SwiftUI

struct CustomRowSwipeActions: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Send message", systemImage: "message") {
                        print("Hi")
                    }
                    
                }
            Text("Johnny Depp")
                    .swipeActions {
                        Button("Delete", systemImage: "minus.circle", role: .destructive) {
                            print("Deleting")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button("Pin", systemImage: "pin") {
                            print("Pinning")
                        }
                        .tint(.orange)
                    }
        }
    }
}

#Preview {
    CustomRowSwipeActions()
}
