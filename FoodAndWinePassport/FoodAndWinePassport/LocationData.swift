//
//  LocationData.swift
//  FoodAndWinePassport
//
//  Created by Jennifer Lee on 7/20/24.
//

import Foundation
import SwiftData
 
 

@Model
class Location {
    var park: String
    var location: String
    var type: String

    //Date = .now
    // init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
    init(park: String, location: String, type: String) {
        self.park = park
        self.location = location
        self.type = type
    }
}
