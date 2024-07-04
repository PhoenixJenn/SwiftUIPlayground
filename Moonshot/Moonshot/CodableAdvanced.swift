//
//  CodableAdvanced.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/4/24.
// https://www.hackingwithswift.com/books/ios-swiftui/working-with-hierarchical-codable-data

import SwiftUI

struct CodableAdvanced: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        // slightly more complex JSON: there will be an array inside another array, using different data types.
        
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            // STRUCTS MUST MATCH JSON

            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
         
                print(user.address.street)
            }

        }
    }
}


struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}


#Preview {
    CodableAdvanced()
}
