//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jennifer Lee on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var startOver = false
    @State private var scoreTitle = ""
    @State private var score : Int = 0
    @State private var counter : Int = 0
    @State private var gameOver : String = ""
    // .shuffled
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
/*:
 two labels telling the user what to do,
 three image buttons showing three world flags.
 
 for _ in 1...3 {
     print(Int.random(in: 1..<100))
 }
 */
    
    var body: some View {
        
    
        ZStack {
            //            Color.blue
            //                .ignoresSafeArea()
            
            
            //            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
            //                .ignoresSafeArea()
            
            //            RadialGradient(stops: [
            //                .init(color: .blue, location: 0.3),
            //                .init(color: .red, location: 0.3),
            //            ], center: .top, startRadius: 200, endRadius: 700)
            //                .ignoresSafeArea()
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                
                VStack(spacing: 10) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Tap the flag of:")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    } // Vstack
                    .padding()
                    
                    
                    ForEach(0..<3) { number in
                        Button() {
                            // flag was tapped
                            flagTapped(number)
                            
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                                .shadow(color:Color.yellow, radius:10)
                        }
                    } //foreach
                    
                } // Vstack
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .padding()
                
                Spacer()
                Spacer()
                Text("Score: \(score) \(gameOver)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                
            } // Zstack
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                    Text("Your score is now \(score). Counter=\(counter)")
            }
            .alert("Play Again?", isPresented: $startOver) {
                Button("Ok", action: resetGame)
                Button("Cancel", role: .cancel) { }
            }
            
          
        }
        
    } // body
        
    
    func flagTapped(_ number: Int) {
        counter += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct, gain a point"
            score += 1
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[correctAnswer]). Lose a point"
            score -= 1
        }
        
        if counter < 8 {
            showingScore = true
        } else {
            gameOver = (" Game Over.")
            startOver  = true
        }
    }
    func resetGame(){
        score = 0
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
} //struct

#Preview {
    ContentView()
}
