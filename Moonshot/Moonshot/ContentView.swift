//
//  ContentView.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/4/24.
//
// https://www.hackingwithswift.com/books/ios-swiftui/moonshot-introduction
// In this app we’re going to load two different kinds of JSON into Swift structs: 
// one for astronauts, and one for missions.
// https://www.hackingwithswift.com/books/ios-swiftui/loading-a-specific-kind-of-codable-data
// Files here: https://github.com/twostraws/HackingWithSwift/tree/main/SwiftUI Project 8
// Download files https://download-directory.github.io/

// https://www.hackingwithswift.com/books/ios-swiftui/formatting-our-mission-view
// https://www.hackingwithswift.com/100/swiftui/41


/*:
 https://www.hackingwithswift.com/books/ios-swiftui/moonshot-wrap-up
 Challenge
 One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on.

 [x]Add the launch date to MissionView, below the mission badge. You might choose to format this differently given that more space is available, but it’s down to you.
 [n/a]Extract one or two pieces of view code into their own new SwiftUI views – the horizontal scroll view in MissionView is a great candidate, but if you followed my styling then you could also move the Rectangle dividers out too.
 For a tough challenge, add a toolbar item to ContentView that toggles between showing missions as a grid and as a list.
 Here's a video but i cheated and made the missions larger in list view which meets criteria but fails on non-iphones :)
 https://www.youtube.com/watch?v=e7u9ZSCtLws
 
 
 */

import SwiftUI

struct ContentView: View {
   // let astronauts = Bundle.main.decode("astronauts.json")
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var cheatGridList = true
    
    var body: some View {
//      Text("hello")
        
        //Text(String(astronauts.count))
       // Text(String(missions.count))
        
        let columns = [
            GridItem(.adaptive(minimum: (cheatGridList == true) ? 150 : 500))
        ]
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) { //
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)

                                VStack {
                                    Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundStyle(.white.opacity(0.5))
//                                    Text(mission.displayName)
//                                        .font(.headline)
//                                    //Text(mission.launchDate ?? "N/A")
//                                    Text(mission.formattedLaunchDate)
//                                        .font(.caption)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            } // Vstack
                            
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            ).padding()
                        }
                    }
                } // lazygrid
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .background(.darkBackground)
            .toolbar {
                Button("Toggle", systemImage: cheatGridList == true ? "list.bullet.circle.fill" : "circle.grid.3x3.fill"  ) {
                    cheatGridList.toggle()
                    //
                    //poweroutlet.type.l.fill
                    //
                    //
                    
                }
            } // toolbar
        }
        
    } //view
}
            

        
        
        



#Preview {
    ContentView()
}
