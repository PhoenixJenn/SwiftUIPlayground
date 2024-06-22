//
//  ListFilesStrings.swift
//  WordScramble
//
//  Created by Jennifer Lee on 6/22/24.
//

import SwiftUI

struct ListFilesStrings: View {
    
    let students = ["Jenn", "Trevor", "Hugh", "Eleanor"]
 
    
    var body: some View {
        VStack {
            // one thing List can do that Form can’t is to generate its rows entirely from dynamic content without needing a ForEach.
            
            List {
                Section("Section 1") {
                    Text("Static row 1")
                    Text("Static row 2")
                }

                Section("Section 2") {
                    ForEach(0..<5) {
                        Text("Dynamic row \($0)")
                    }
                }

                Section("Section 3") {
                    Text("Static row 3")
                    Text("Static row 4")
                }
            }.listStyle(.grouped)
        }
        
        VStack{
            List {
                Text("Static Row")

                ForEach(students, id: \.self) {
                    Text($0)
                }

                Text("Static Row")
            }
        }
        .padding()
    }
    
    func doStuff(){
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle!
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
            }
        }
        
        
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        
        
        let input2 = """
                    a
                    b
                    c
                    """
        let letters2 = input.components(separatedBy: "\n")
        let letter = letters2.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        
        // UTF-16 is what’s called a character encoding – a way of storing letters in a string.
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
    }
    
}

#Preview {
    ListFilesStrings()
}
