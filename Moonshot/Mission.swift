//
//  Mission.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/6/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
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


