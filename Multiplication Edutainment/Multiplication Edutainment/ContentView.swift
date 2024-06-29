//
//  ContentView.swift
//  Multiplication Edutainment
//
//  Created by Jennifer Lee on 6/29/24.
// CHALLENGE
// https://www.hackingwithswift.com/guide/ios-swiftui/3/3/challenge

/*:
 REQUIREMENTS
 MVP
 [ ] The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an “Up to…” stepper, going from 2 to 12.
 [ ] The player should be able to select how many questions they want to be asked: 5, 10, or 20.
 [ ] You should randomly generate as many questions as they asked for, within the difficulty range they asked for.
 [ ] Start with some steppers, a text field and a couple of buttons
 [ ] add some state to determine whether the game is active or whether you’re asking for settings
 [ ] Generate a range of questions based on the user’s settings
 [ ] Show the player how many questions they got correct at the end of the game, then offer to let them play again.
 ---------
 MLP
 [  ] break up your layouts into new SwiftUI views rather than putting everything in ContentView; This requires passing data between views
 [  ]throw away fixed controls like Stepper entirely if you wanted, and instead rely on colorful buttons to get the same result
 [ ] Animal Bundle https://kenney.nl/assets/animal-pack-redux
 [  ]  add some animations, too – it needs to appeal to kids 9 and under, so bright and colorful is a good idea
 
 Hints:

 You should generate all your questions as soon as your game starts, storing them as an array of questions.
 Those questions should probably be their own Swift struct, Question, storing the text and the answer.
 When it comes to asking questions, use another state property called questionNumber or similar, which is an integer pointing at some position in your question array.
 You can get user input either using buttons on the screen, like a calculator, or using a number pad text field – whichever you prefer.
 If you intend to pass a closure into a view’s initializer for later use, Xcode will force you to mark it as @escaping. This means “will be used outside of the current method.”
 
 
 for _ in 1...3 {
     print(Int.random(in: 1..<100))
 
 */

import SwiftUI

struct ContentView: View {
    
    @State private var startNumber : Int = 1
    @State private var endNumber : Int = 12
    @State private var fill = false
    @State private var isPlaying = false
    @State private var startNum = true
    var body: some View {
        
//        Button( action: {self.isPlaying.toggle()} )
//        {
//            Image(systemName: self.isPlaying == true ? "pause.fill" : "play.fill")
//        }
        
        //let numberRange = startNumber...endNumber
        
        ZStack{
            LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            Text(" Multiplication Tables ")
                .font(.largeTitle)
        } // zstack
        
            VStack{
                // add logic to know which number they are choosing (start or end)
                Form{
                    Text("Tables from \(startNumber)-\(endNumber)")
                    //https://developer.apple.com/documentation/swiftui/picker
                    Picker("Select", selection: $startNum) {
                            Text("Start Number")
                            Text("End Number")
                    
                    }
                    .pickerStyle(.segmented)
                }
                
                    
                
                HStack(spacing:1) {
                    ForEach (1..<13){
                        number in
                        Button(action: {evalSelection(choice: number)} ) {
                            Image(systemName: (startNumber == number || endNumber == number) ? "\(number).circle" : "\(number).circle.fill")
                            // .foregroundStyle(.black) // change color based on selection
                                  // only add square.fill if selected
                        }.font(.system(size: 25))
                    }
                } // hstack
                .alert("\(startNumber)", isPresented: $isPlaying) {
                    Button("Cancel", role: .cancel) { }
                }
                
                Spacer()
                
//                HStack(spacing:1) {
//                    ForEach (1..<13){
//                        number in
//                        Button() {
//                             evalSelection(choice: number)
//                            
//                        } label: {
//                            Image(systemName: (startNumber == number || endNumber == number) ? "\(number).square.fill" : "\(number).square")
//                            
//                           
//                                  // only add square.fill if selected
//                               
//                        }.font(.system(size: 25))
//                    }
//                } // hstack
                
                Spacer()
                
            } // vstack
      Spacer()
        
      
       
    }
        func evalSelection(choice: Int){
            if (choice < startNumber || (choice > startNumber && choice < endNumber)){
                startNumber = choice
               // isPlaying=true
            } else if (choice > endNumber || (choice < endNumber && choice > startNumber)){
                endNumber = choice
              //  isPlaying=true
            } else {
               // isPlaying = false
            }
            
            // when selected,change image to number.square.fill
            // if less than lowest,
            // flip lowest to empty square
            // set lowest to new number
            // if higher than highest
            // flip highest to empty
            // set highest to new number
        }
        
//        VStack{
//             Stepper("\(startNumber.formatted()) ", value: $startNumber, in: 1...12, step: 1)
//           Text("End:")
//               .font(.headline)
//            Stepper("\(endNumber.formatted()) ", value: $endNumber, in: numberRange, step: 1)
//        }
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
   
    
   
}

#Preview {
    ContentView()
}
