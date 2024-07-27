//
//  ContentView.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView {
            NavigationLink{
                SchedLocalNotifications()
            } label: {
                Text("Feed Cat Notification")
            }
            
        }
        Text("Once your notification has been added press Cmd+L in the simulator to lock the screen.")
         
        
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
        
        
    }
    
}

#Preview {
    ContentView()
}
