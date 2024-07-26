//
//  WikiResults.swift
//  BucketList
//
//  Created by Jennifer Lee on 7/26/24.
//
// https://www.hackingwithswift.com/books/ios-swiftui/downloading-data-from-wikipedia
import SwiftUI
import Foundation
 

 
struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
