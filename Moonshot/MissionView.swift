//
//  MissionView.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/6/24.
//

// containerRelativeFrame : to get precise sizes to make the most of our space.


import SwiftUI

struct MissionView: View {
    
        let mission: Mission // requires a mission
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let crew: [CrewMember]

        var body: some View {
            
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                        .padding(.top)

                    VStack(alignment: .leading) {
                        
                        //----
                        /*:
                         
                         Why after the VStack rather than inside? Because scroll views work best when they take full advantage of the available screen space, which means they should scroll edge to edge. If we put this inside our VStack it would have the same padding as the rest of our text, which means it would scroll strangely – the crew would get clipped as it hit the leading edge of our VStack, which looks odd.
                         */
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                       
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(crew, id: \.role) { crewMember in
                                    NavigationLink {
                                        Text("Astronaut details")
                                        AstronautView(astronaut: crewMember.astronaut)
                                    } label: {
                                        HStack {
                                            Image(crewMember.astronaut.id)
                                                .resizable()
                                                .frame(width: 104, height: 72)
                                                .clipShape(.capsule)
                                                .overlay(
                                                    Capsule()
                                                        .strokeBorder(.white, lineWidth: 1)
                                                )

                                            VStack(alignment: .leading) {
                                                Text(crewMember.astronaut.name)
                                                    .foregroundStyle(.white)
                                                    .font(.headline)
                                                Text(crewMember.role)
                                                    .foregroundStyle(.white.opacity(0.5))
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        
                        // ----
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)

                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(.lightBackground)
                            .padding(.vertical)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
     
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
}
