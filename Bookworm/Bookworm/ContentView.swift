//
//  ContentView.swift
//  Bookworm
//
//  Created by Jennifer Lee on 7/16/24.
//

import SwiftUI
import SwiftData


/*:
CHALLENGE:
[x] Right now it’s possible to select no title, author, or genre for books, which causes a problem for the detail view. Please fix this, either by forcing defaults, validating the form, or showing a default picture for unknown genres – you can choose.
[x] Modify ContentView so that books rated as 1 star are highlighted somehow, such as having their name shown in red.
[x] Add a new “date” attribute to the Book class, assigning Date.now to it so it gets the current date and time, then format that nicely somewhere in DetailView.
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-format-dates-inside-text-views 
 Check BetterRest for date
 
 */
struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    //@Query var books: [Book]
    // @Query(sort: \Book.title) var books: [Book]
    // @Query(sort: [SortDescriptor(\Book.title)]) var books: [Book]
    // @Query(sort: [SortDescriptor(\Book.title, order: .reverse)]) var books: [Book]
    //@Query(sort: \Book.rating, order: .reverse) var books: [Book]
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
            
            
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                    .foregroundColor(book.rating==1 ? .red : .black)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }.navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let book = books[offset]

            // delete it from the context
            modelContext.delete(book)
        }
    }
    
    
}

#Preview {
    ContentView()
}
