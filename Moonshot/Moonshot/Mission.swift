//
//  Mission.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/6/24.
//

import Foundation

struct Mission: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    // How to force Equatable when one property is optional
    // https://www.hackingwithswift.com/example-code/language/how-to-conform-to-the-equatable-protocol
    static func ==(leftid: Mission, rightid: Mission) -> Bool {
        return leftid.id == rightid.id
    }
    
    // how to conform to hashable - ID is distinct enough
// https://www.hackingwithswift.com/example-code/language/how-to-conform-to-the-hashable-protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    
    
    
    // nested struct
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
}


