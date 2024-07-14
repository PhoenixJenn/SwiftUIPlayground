//
//  MusicExample.swift
//  CupcakeCorner
//
//  Created by Jennifer Lee on 7/14/24.
// https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui

import SwiftUI

struct MusicExample: View {
    @State private var results = [Result]()
        
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        } //list
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        do {
            /*:
             The return value from data(from:) is a tuple containing the data at the URL and some metadata describing how the request went. We don’t use the metadata, but we do want the URL’s data, hence the underscore – we create a new local constant for the data, and toss the metadata away.
             */
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    MusicExample()
}


struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
