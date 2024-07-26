//
//  ContentView.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//

import SwiftUI

struct ContentView: View {
    //@State private var selection: String?
    @State private var selection = Set<String>()
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]

    var body: some View {
        
       
        
        EditButton()
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
//        if let selection {
//            Text("You selected \(selection)")
//        }
        if selection.isEmpty == false {
            Text("You selected \(selection.formatted())")
        }
        /*:
         iOS does have a fairly hidden gesture for activating multi-select mode: if you swipe horizontally on your data using two fingers, it will activate. If you're using the simulator, you need to hold down the Option key to enable two-finger mode, then also hold down the Shift key to enable swiping, and now swipe from left to right on the list.
         */
    }
    
}

#Preview {
    ContentView()
}
