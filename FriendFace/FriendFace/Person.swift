//
//  Person.swift
//  FriendFace
//
//  Created by Jennifer Lee on 7/21/24.
//

import Foundation
import SwiftData

// https://www.hackingwithswift.com/books/ios-swiftui/adding-codable-conformance-for-published-properties

@Model
class Person : Identifiable, Decodable {
    var id : UUID
    var isActive : Bool
    var name : String
    var age : Int
    var company : String
    var email : String
    var address : String
    var about : String
    var registered : Date
    var tags : [String]
    
    @Relationship(deleteRule: .cascade) var friends = [Friend]()
    //var friends : [Friend]
    
    init(id: UUID, isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: Date, tags: [String], friends: [Friend]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case isActive
        case name
        case age
        case company
        case email
        case address
        case about
        case registered
        case tags
        case friends
//        case _id = "id"
//        case _isActive = "isActive"
//        case _name = "name"
//        case _age = "age"
//        case _company = "company"
//        case _email = "email"
//        case _address = "address"
//        case _about = "about"
//        case _registered = "registered"
//        case _tags = "tags"
//        case _friends = "friends"
    }
    
    // https://www.hackingwithswift.com/books/ios-swiftui/adding-codable-conformance-for-published-properties
    //https://www.hackingwithswift.com/forums/swiftui/can-someone-explain-my-mistake-here/24252
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(UUID.self, forKey: .id)
        isActive = try values.decode(Bool.self, forKey: .isActive)
        name = try values.decode(String.self, forKey: .name)
        age = try values.decode(Int.self, forKey: .age)
        company = try values.decode(String.self, forKey: .company)
        email = try values.decode(String.self, forKey: .email)
        address = try values.decode(String.self, forKey: .address)
        about = try values.decode(String.self, forKey: .about)
        registered = try values.decode(Date.self, forKey: .registered)
        tags = try values.decode([String].self, forKey: .tags)
        friends = try values.decode([Friend].self, forKey: .friends)
        
    }
    
    /*:
     if let decodedAddresses = try? JSONDecoder().decode([Address].self, from: addressArray) {
         // without self. it won't let you set this since it is a constant/let
         self.addressArray = decodedAddresses
         return
     }
     */
    
    
}


/*:
 
 "id": "50a48fa3-2c0f-4397-ac50-64da464f9954",
         "isActive": false,
         "name": "Alford Rodriguez",
         "age": 21,
         "company": "Imkan",
         "email": "alfordrodriguez@imkan.com",
         "address": "907 Nelson Street, Cotopaxi, South Dakota, 5913",
         "about": "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
         "registered": "2015-11-10T01:47:18-00:00",
         "tags": [
             "cillum",
             "consequat",
             "deserunt",
             "nostrud",
             "eiusmod",
             "minim",
             "tempor"
         ],
         "friends": [
             {
                 "id": "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0",
                 "name"
 */
