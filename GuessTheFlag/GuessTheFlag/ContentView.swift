//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jennifer Lee on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    // .shuffled
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
/*:
 two labels telling the user what to do,
 three image buttons showing three world flags.
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
                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                
            } // Zstack
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is ???")
            }
            
          
        }
        
    } // body
        
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

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
