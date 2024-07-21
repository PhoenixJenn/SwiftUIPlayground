//
//  DestinationData.swift
//  FoodAndWinePassport
//
//  Created by Jennifer Lee on 7/20/24.
//

import Foundation
import SwiftData

@Model
class Destination {
    
    let types = ["Attraction", "Shopping", "Dining", "Refreshments"]
    var destinationID: UUID
    var destination: String
    var destinationMapID: Int?
    var location: String
    var type: String
    var open: Bool = true

    //Date = .now
    // init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
    init(destinationID: UUID, destination: String, destinationMapID: Int?, location: String, type: String, open: Bool) {
        self.destinationID = destinationID
        self.destination = destination
        self.destinationMapID = destinationMapID
        self.location = location
        self.type = type
        self.open = open
    }
    
    
}
