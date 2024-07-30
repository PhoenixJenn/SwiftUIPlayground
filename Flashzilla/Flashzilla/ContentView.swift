//
//  ContentView.swift
//  Flashzilla
//
//  Created by Jennifer Lee on 7/29/24.
//

/*:
 
 Active scenes are running right now, which on iOS means they are visible to the user. On macOS an app’s window might be wholly hidden by another app’s window, but that’s okay – it’s still considered to be active.
 Inactive scenes are running and might be visible to the user, but the user isn’t able to access them. For example, if you’re swiping down to partially reveal the control center then the app underneath is considered inactive.
 Background scenes are not visible to the user, which on iOS means they might be terminated at some point in the future
 
 Command R to build and Run
 */
import SwiftUI

struct ContentView: View {


    
    @Environment(\.scenePhase) var scenePhase

        var body: some View {
            Text("Hello, world!")
                .onChange(of: scenePhase) { oldPhase, newPhase in
                    if newPhase == .active {
                        print("Active")
                    } else if newPhase == .inactive {
                        print("Inactive")
                    } else if newPhase == .background {
                        print("Background")
                    }
                }
            
       
    }
}

#Preview {
    ContentView()
}
