//
//  ContentView.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//

/*:
 
 Challenge
 One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on.

 Add an icon to the “Everyone” screen showing whether a prospect was contacted or not.
 Add an editing screen, so users can adjust the name and email address of someone they scanned previously. (Tip: Use the simple form of NavigationLink rather than navigationDestination(), to avoid your list selection code confusing the navigation link.)
 Allow users to customize the way contacts are sorted – by name or by most recent.
 */
import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
//        NavigationView {
//            NavigationLink{
//                SchedLocalNotifications()
//            } label: {
//                Text("Feed Cat Notification")
//            }
//            
//        }
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
