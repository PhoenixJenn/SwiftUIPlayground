//
//  ContentView.swift
//  WordScramble
//
//  Created by Jennifer Lee on 6/21/24.
//

/*:
 CHALLENGE
 
 [*] Disallow answers that are shorter than three letters or are just our start word.
 [*] Add a toolbar button that calls startGame(), so users can restart with a new word whenever they want to.
 [*] Put a text view somewhere so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.
 
 */

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var allWords = [String]()
    @State private var newWord = ""
    @State private var entertext : String = ""
    @State private var score : Int = 0
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
       
        NavigationStack {
            
            List {
                
                Section("Instructions here") {
                    
                    TextField("Enter your word", text: $newWord)
                }.textInputAutocapitalization(.never)
//1.circle.fill
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            } // list
            .navigationTitle(rootWord)
            .toolbar {
                Button("Start Game", action: newGame)
                Button("New Word", action: resetWord)
            }
            
        } // navigation stack
        
        .onSubmit(addNewWord)
        .onAppear(perform: startGame)
        .alert(errorTitle, isPresented: $showingError) {
            Button("OK") { }
        } message: {
            Text(errorMessage)
        }
        
        VStack
        {
            Text("Score: \(score)")
        }
        //every time users enter a word into the text field, we’ll automatically add it to the list of used words.
     
        //Later, though, we’ll add some validation to make sure the word hasn’t been used before, can actually be produced from the root word they’ve been given, and is a real word and not just some random letters.
       
        
//        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//            .keyboardType(.decimalPad)
//            .focused($amountIsFocused)
        
        
    }
    
    //Lowercase newWord and remove any whitespace
    //Check that it has at least 1 character otherwise exit
    //Insert that word at position 0 in the usedWords array
    //Set newWord back to be an empty string
    func newGame(){
        score = 0
    }
    func resetWord()  {
        
        rootWord = allWords.randomElement() ?? "silkworm"
        usedWords = []
        return
    }
    func startGame(){
     
        // 1. Find the URL for start.txt in our app bundle
            if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
                // 2. Load start.txt into a string
                if let startWords = try? String(contentsOf: startWordsURL) {
                    // 3. Split the string up into an array of strings, splitting on line breaks
                   // let allWords = startWords.components(separatedBy: "\n")
                    allWords = startWords.components(separatedBy: "\n")
                    // 4. Pick one random word, or use "silkworm" as a sensible default
                    rootWord = allWords.randomElement() ?? "silkworm"
                    
                    //newGame()
                    
                    // If we are here everything has worked, so we can exit
                    return
                }
            }

            // If were are *here* then there was a problem – trigger a crash and report the error
            fatalError("Could not load start.txt from bundle.")
        
    } // func
    
    func isStartWord(word: String)-> Bool {
        !(word == rootWord)
    }
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    func isMultiWord(word: String) -> Bool {
        !word.contains(" ")
    }
    func isTooShort(word: String) -> Bool {
        !(word.count < 3)
    }
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        // extra validation to come
        
        guard isStartWord(word: answer) else {
            wordError(title: "Not derivative", message: "Cannot use start word")
            return
        }
        guard isMultiWord(word: answer) else{
            wordError(title: "Space detected", message: "Multiple Words not allowed")
            return
        }
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        guard isTooShort(word: answer) else {
            wordError(title: "Too Short", message: "Words must be 3+ characters")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        score += answer.count
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
         
        newWord = ""
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

#Preview {
    ContentView()
}
