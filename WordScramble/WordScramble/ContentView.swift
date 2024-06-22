//
//  ContentView.swift
//  WordScramble
//
//  Created by Jennifer Lee on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var entertext : String = ""
    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
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
            }
            .navigationTitle(rootWord)
        }
        .onSubmit(addNewWord)
        
        

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
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        // extra validation to come
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
         
        newWord = ""
    }
}

#Preview {
    ContentView()
}
