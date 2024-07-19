//
//  Data.swift
//  Bookworm
//
//  Created by Jennifer Lee on 7/16/24.
//

import Foundation
import SwiftData
 
 

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var reviewDate: Date  = Date.now
    //Date = .now
    // init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
    init(title: String, author: String, genre: String, review: String, rating: Int, reviewDate: Date = .now) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.reviewDate = reviewDate
    }
}
