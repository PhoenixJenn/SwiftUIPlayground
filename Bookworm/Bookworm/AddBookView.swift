//
//  AddBookView.swift
//  Bookworm
//
//  Created by Jennifer Lee on 7/17/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var reviewDate : Date = Date.now
    
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }

//                Section("Write a review") {
//                    TextEditor(text: $review)
//
//                    Picker("Rating", selection: $rating) {
//                        ForEach(0..<6) {
//                            Text(String($0))
//                        }
//                    }
//                }
             
               

                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, reviewDate: reviewDate)
                        modelContext.insert(newBook)
                        dismiss()
                    }.disabled(hasValidContent == false)
                }
            }
            .navigationTitle("Add Book")
        }
        
        
    } // body
    
    
    func checkForEmpty(value : String)-> Bool {
        var isEmpty : Bool
        isEmpty = value.isEmpty || value.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 ? true : false
        return isEmpty
    }
    
    var hasValidContent: Bool {
        if checkForEmpty(value: title) || checkForEmpty(value: author) || checkForEmpty(value: genre) || checkForEmpty(value: review) {
            return false
        }

        return true
    }
}

#Preview {
    AddBookView()
}
