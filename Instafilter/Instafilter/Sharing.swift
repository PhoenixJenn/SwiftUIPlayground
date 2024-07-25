//
//  Sharing.swift
//  Instafilter
//
//  Created by Jennifer Lee on 7/25/24.
//

import SwiftUI

struct Sharing: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
        Divider()
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!"))
        
        Divider()
        
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
            Label("Spread the word about Swift", systemImage: "swift")
        }
        
        Divider()
        
        let example = Image(.curiousity)

        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
        
    }
}

#Preview {
    Sharing()
}
