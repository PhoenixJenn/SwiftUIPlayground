//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Jennifer Lee on 7/26/24.
//

import Foundation
import CoreLocation
extension ContentView {
    
    @Observable
    class ViewModel {
         
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        
        //private(set) var locations = [MapLocation]() // no need to initiatize to empty string, setup in init()
        private(set) var locations: [MapLocation]
        var selectedPlace: MapLocation?
        
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = MapLocation(id: UUID(), name: "New location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: MapLocation) {
            guard let selectedPlace else { return }

            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
            save() 
        }
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([MapLocation].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
    }
    
    
}
