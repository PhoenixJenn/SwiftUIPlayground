//
//  ContentView.swift
//  BucketList
//
//  Created by Jennifer Lee on 7/25/24.
//

/*:
 Before we move on, here’s a small challenge for you: back in project 8 we looked at how to create a generic extension on Bundle that let us find, load, and decode any Codable data from our app bundle. Can you write something similar for the documents directory, perhaps making it an extension on FileManager?
 https://www.hackingwithswift.com/books/ios-swiftui/writing-data-to-the-documents-directory

 */
import SwiftUI
import MapKit

struct ContentView: View {
    @State private var locations = [MapLocation]()
    @State private var selectedPlace: MapLocation?
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        Text("Hello World")
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                     
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                selectedPlace = location
                            }
                    }
                }
            }
            .sheet(item: $selectedPlace) { place in
                //Text(place.name)
                EditView(location: place) { newLocation in
                    if let index = locations.firstIndex(of: place) {
                        locations[index] = newLocation
                    }
                }
            }
            
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        let newLocation = MapLocation(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                        locations.append(newLocation)
                    }
                }
        }
        
        
        
    }
}

#Preview {
    ContentView()
}

struct MapLocation: Codable, Equatable, Identifiable {
    
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    /*:
     Tip: If you wanted, you could wrap the static let example line with #if DEBUG and #endif to avoid it being built into your App Store releases.
     */
    static let example = MapLocation(id: UUID(), name: "Buckingham Palace", description: "Lit by over 40,000 lightbulbs.", latitude: 51.501, longitude: -0.141)
    
    static func ==(lhs: MapLocation, rhs: MapLocation) -> Bool {
        lhs.id == rhs.id
    }
}

