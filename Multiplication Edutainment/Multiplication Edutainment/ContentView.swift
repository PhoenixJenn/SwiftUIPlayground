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
 [x] The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an “Up to…” stepper, going from 2 to 12.
 [ ] The player should be able to select how many questions they want to be asked: 5, 10, or 20.
 [ ] You should randomly generate as many questions as they asked for, within the difficulty range they asked for.
 [x] Start with some steppers, a text field and a couple of buttons
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
    @State private var startEndSelection = "Start Number"
    @State private var answer : Int = 0
    @State private var num1 : Int = 1
    @State private var num2 : Int = 1
    @State private var score : Int = 0
    @State private var count : Int = 0
    @State private var message : String = ""
    @State private var setup : Bool = true
    
    @FocusState private var answerIsFocused: Bool
    
    var startEnd = ["Start Number", "End Number"]
   
    
    var body: some View {
        
        
//        Button( action: {self.isPlaying.toggle()} )
//        {
//            Image(systemName: self.isPlaying == true ? "pause.fill" : "play.fill")
//        }
        
           
        ZStack{
            LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            Text(" Multiplication Tables ")
                .font(.largeTitle)
                .bold()
            
            
        } // zstack
        
        VStack{
            // Play Space
            // TODO
            // if setup == true then DO NOT SHOW this section.
            Text("Tables from \(startNumber)-\(endNumber)")
            Spacer()
            Spacer()
            HStack{
                Image(systemName:"\(num1).square.fill")
                    .font(.system(size:60))
                    .foregroundStyle(.red)
                // First Number
                Image(systemName:"multiply")
                    .font(.system(size:30))
                // Second Number
                Image(systemName:"\(num2).square.fill")
                    .font(.system(size:60))
                    .foregroundStyle(.red)
                Image(systemName:"equal")
                    .font(.system(size:30))
                
                
                TextField("Amount", value: $answer, format: .number, prompt: Text("Answer"))
                    .keyboardType(.decimalPad)
                    .focused($answerIsFocused)
                    .foregroundColor(.blue)
                          //.background(.yellow)
                          .border(Color.red)
                          .font(.largeTitle)
                          .frame(width: 70, height: 90)
                  .onSubmit {
                      checkAnswer()
                          }
            }
            
            Spacer()
            
        }
        
            VStack{
                // add logic to know which number they are choosing (start or end)
                Spacer()
                Spacer()
                Spacer()
                    //https://developer.apple.com/documentation/swiftui/picker
                    Picker("Select", selection: $startEndSelection) {
                        ForEach(startEnd, id: \.self) {
                                Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
               
                Spacer()
                
                HStack(spacing:1) {
                    ForEach (1..<13){
                        number in
                        Button(action: {evalSelection(choice: number)} ) {
                            Image(systemName: (number < startNumber ||  number > endNumber) ? "\(number).circle" : "\(number).circle.fill")
                                .foregroundStyle((startNumber == number || endNumber == number || number < startNumber || number > endNumber) ? .blue : .red)
                        }.font(.system(size: 25))
                    }
                    
                } // hstack
                .alert("\(message)", isPresented: $isPlaying) {
                    Button("OK", role: .cancel) { }
                }
                Spacer()
                Text("Score: \(score) / \(count)")
               
                
            } // vstack
  

        NavigationStack {
            Spacer()
                //.navigationTitle("SwiftUI")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("Reset Range", action: doNothing)
                        Button("Start Game", action: setupGame)
                    }
                    
                }
        }
      
       
    }
        
    func doNothing(){
        // if reset range, then need to setup = true and  hide top
        
        score = 0
        startNumber = 1
        endNumber = 12
        answer = 0
    }
        func evalSelection(choice: Int){
            // all included number tables will be solid
            // when selected, change start or end to number.square and flip other one to .fill
          
            // if "start number" and : less than current start number,
            // flip lowest to empty square
            // set lowest to new number
            // if end Number and : higher than current end number or lower than current but still greater than start number
            // flip highest to empty
            // set highest to new number
            
            if (startEndSelection == "Start Number" && (choice < startNumber || (choice > startNumber && choice < endNumber))){
                startNumber = choice
               // isPlaying=true
                

            } else if (startEndSelection == "End Number" && (choice > endNumber || (choice < endNumber && choice > startNumber))){
                endNumber = choice
               // isPlaying=true
            } else {
               // isPlaying = false
            }
            
          
        }
    func setupGame(){
        // setup = false // no longer in setup mode.
        // num1 = pick a random first number between startNumber and endNumber
        // num2 = pick a random second number between 1 and 12
        num1 = Int.random(in: startNumber ... endNumber)
        num2 = Int.random(in: 1 ... 12)
        answer = 0
       
        
    }
        
        func checkAnswer(){
           // do nothing
            if (num1 * num2 == answer){
                // add formula to string array
               // equations[num1] = num2
                score += 1
                message = "Great answer!"
              
            } else {
                message = "Incorrect. The answer is: \(num1) x \(num2) = " + String(num1 * num2)
            }
            count += 1
            isPlaying=true
            setupGame()
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
