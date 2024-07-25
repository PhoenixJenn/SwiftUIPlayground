//
//  BegForReviews.swift
//  Instafilter
//
//  Created by Jennifer Lee on 7/25/24.
//

import SwiftUI
import StoreKit

struct BegForReviews: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        /*:
         
         it's better to call requestReview() automatically when you think it's the right time. A good starting place is when the user has performed an important task some number of times, because that way it's clear they have realized the benefit of your app.
         */
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    BegForReviews()
}
