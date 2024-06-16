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
    
    
    @State private var rps = ["Rock",  "Paper" , "Scissors"] //.shuffled()
    @State private var winningMoves = ["Paper", "Scissors", "Rock"]
    
    // Rock > Scissors; Paper > Rock; Scissors > Paper;
    @State private var appChoice : String = ""
    @State private var appChoiceInt : Int = 0
    @State private var userWin : Bool = Bool.random()
    @State private var winLoseSuccessMessage : String = ""
    @State private var score : Int = 0
    @State private var gameCounter : Int = 0

    
    var body: some View {
        Spacer()
        VStack{
            Text("Game: \(gameCounter)")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Text("Score: \(score)")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        // --------------------------------
        VStack {
            Button("Generate App Pick") {
                play()
            }.padding(15)
                .background(.gray)
                .foregroundStyle(.white)
                .clipShape(.capsule)
            
            HStack {
                Text("The app picks: ")
                Text("\(appChoice)")
                    .font(.largeTitle)
            }
        }
   
        // --------------------------------
        HStack{
            Text("Your goal is to: ")
            
            Text(userWin ? "Win " : "Lose")
                .padding(5)
                .font(.largeTitle)
        }
        // --------------------------------
        VStack {
            Spacer()
            Text("\(winLoseSuccessMessage)")
            Spacer()
        }
        .padding()
        
        VStack {
            
            Section("Choose your weapon!"){
            HStack{
                Button("🪨"){
                    evalChoice(choice: 2) //"Rock"
                }
                    //.padding(25)
                    //.background(.red)
                    .foregroundStyle(.white)
                    //.frame(width: 120, height: 40)
                    .font(.system(size: 100))
                    
                Button("🗒️"){
                    evalChoice(choice:0) //"Paper"
                }

                    .font(.system(size: 100))
                    .foregroundStyle(.white)
                Button("✂️"){
                    evalChoice(choice:1) //"Scissors"
                }
                    .font(.system(size: 100))
            }
            } // group
            .padding(10)
            .fontWeight(.bold)
            
            Spacer()
            
            
            Spacer()
            
        }
    }
    
    func play(){
        
        appChoiceInt = Int.random(in: 0...2)
        appChoice = rps[appChoiceInt]
        winLoseSuccessMessage = ""
        userWin = Bool.random()
    }
    
    func evalChoice(choice: Int){
        gameCounter += 1
        // rps rock paper scissors
        // winningMoves paper scissors rock
        
        if winningMoves[choice] == rps[appChoiceInt] {
            winLoseSuccessMessage = "No Winner. \(winningMoves[choice]) \(choice)  and the app chose \(rps[appChoiceInt])"
        }  else if (choice == appChoiceInt && userWin) || !userWin && choice != appChoiceInt {
            // win
            score += 1
            winLoseSuccessMessage = "Great Job. 🏆 \(userWin ? winningMoves[choice] : rps[appChoiceInt]) beats \(userWin ? rps[appChoiceInt] : winningMoves[choice])"
        } else {
            winLoseSuccessMessage = "You Lose. You chose \(winningMoves[choice]) \(choice)  and the app chose \(rps[appChoiceInt]) \(appChoiceInt). Your goal was to \(userWin ? "win" : "lose")."
        }
        
      
        return
    }
    
}

#Preview {
    ContentView()
}
