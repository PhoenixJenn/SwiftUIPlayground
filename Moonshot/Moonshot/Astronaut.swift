//
//  Astronaut.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/5/24.
//
// https://www.hackingwithswift.com/books/ios-swiftui/loading-a-specific-kind-of-codable-data

import Foundation

// identifiable means it has an ID
/*:
 Codable so we can create instances of this struct straight from JSON, but also Identifiable so we can use arrays of astronauts inside ForEach and more – that id field will do just fine.
 
 Need to convert astronauts.json into a dictionary of Astronaut instances, which means we need to use Bundle to find the path to the file, load that into an instance of Data, and pass it through a JSONDecoder
 
 Previously we put this into a method on ContentView, but here I’d like to show you a better way: we’re going to write an extension on Bundle to do it all in one centralized place.
 
 */
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
