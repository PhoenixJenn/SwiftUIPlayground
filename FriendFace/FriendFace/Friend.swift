//
//  Friend.swift
//  FriendFace
//
//  Created by Jennifer Lee on 7/21/24.
//

import Foundation
import SwiftData

@Model
class Friend : Decodable{
    var id : UUID
    var name : String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(UUID.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
    }
}
