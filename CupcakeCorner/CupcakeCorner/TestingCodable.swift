//
//  TestingCodable.swift
//  CupcakeCorner
//
//  Created by Jennifer Lee on 7/15/24.
// https://www.hackingwithswift.com/books/ios-swiftui/adding-codable-conformance-to-an-observable-class

import SwiftUI

struct TestingCodable: View {
    
    var body: some View {
        
            Button("Encode Taylor", action: encodeTaylor)
    }

    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
        /*:
         Check out what it prints. _name vs name
         Remember, the @Observable macro is quietly rewriting our class so that it can be monitored by SwiftUI, and here that rewriting is leaking – we can see it happening, which might cause all sorts of problems. If you're trying to send a "name" value to a server, it might have no idea what to do with "_name", for example.

         To fix this we need to tell Swift exactly how it should encode and decode our data. This is done by nesting an enum inside our class called CodingKeys, and making it have a String raw value and a conformance to the CodingKey protocol. Yes, that's a bit confusing – the enum is called CodingKeys and the protocol is CodingKey, but it does matter.

         Inside the enum you need to write one case for each property you want to save, along with a raw value containing the name you want to give it. In our case, that means saying that _name – the underlying storage for our name property – should be written out as the string "name", without an underscore:
         */
    }
        
    
}

#Preview {
    TestingCodable()
}


@Observable
class User: Codable {
    // the enum is called CodingKeys and the protocol is CodingKey
    // confoming to the CodingKey protocol is important to fix the issue
    // This coding key mapping works both ways: when Codable sees name in some JSON, it will automatically be saved in the _name property.
    enum CodingKeys: String, CodingKey {
            case _name = "name"
        }
    var name = "Taylor"
}
