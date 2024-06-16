//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jennifer Lee on 6/16/24.
//

import SwiftUI

struct ContentView: View {
//    private enum RockPaperScissors {
//        case rock, paper, scissors
//    }
//    @State private var appChoice : RockPaperScissors = RockPaperScissors.paper
    
    
    @State private var rps = ["Rock", "Scissors", "Paper" ] //.shuffled()
    // Rock > Scissors; Paper > Rock; Scissors > Paper;
    @State private var appChoice : String = ""
    @State private var userWin : Bool = true
     
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                
                
                HStack{
                    Button("Rock"){
                        // evalChoice("Rock")
                    }
                        .background(.red)
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 40)
                    Button("Paper"){
                        // evalChoice("Paper")
                    }
                        .background(.blue)
                        .frame(width: 100, height: 40)
                        .foregroundStyle(.white)
                    Button("Scissors"){
                        // evalChoice("Scissors")
                    }
                        .background(.green)
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 40)
                }
                
            }
            Spacer()
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            
            Text(userWin ? "Your Goal: Win " : "Your Goal: Lose")
            Text("The app picks: ")
            Text("\(appChoice)")
                .font(.largeTitle)
            Spacer()
            Spacer()
            Button("Play") {
                play()
            }
            
        }
        .padding()
    }
    
    func play(){
        appChoice = rps[Int.random(in: 0...2)]
    }
    
    
}

#Preview {
    ContentView()
}
