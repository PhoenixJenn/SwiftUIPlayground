//
//  Mapping.swift
//  BucketList
//
//  Created by Jennifer Lee on 7/25/24.
// https://www.hackingwithswift.com/books/ios-swiftui/integrating-mapkit-with-swiftui
/*:
 
 Hold down the Option key to trigger two-finger pinching. If you click and drag while option is held down, the virtual fingers will move closer or further.
 Hold down Option and Shift to trigger two-finger panning. If you click and drag up and down while this combination is held down, you'll adjust the tilt of the map.
 You can also mimic the single-finger zoom by tapping once, then tapping and dragging up or down.
 
 */


import SwiftUI
import MapKit

struct Mapping: View {
    // Location is defined as struct at bottom of page
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            MapReader { proxy in
                Map()
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            print(coordinate)
                        }
                    }
            }
            
            Divider()
            Map {
                ForEach(locations) { location in
                    //Marker(location.name, coordinate: location.coordinate)
                    Annotation(location.name, coordinate: location.coordinate) {
                        Text(location.name)
                            .font(.headline)
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                    .annotationTitles(.hidden)
                }
            }
            Divider()
            Map(position: $position)
                .onMapCameraChange { context in
                    print(context.region)
                }
            
            
            
            /*:
             or post continuous updates
             Map(position: $position)
                 .onMapCameraChange(frequency: .continuous) { context in
                     print(context.region)
                 }
             */
        }
        HStack(spacing: 50) {
            Button("Paris") {
                position = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
            }

            Button("Tokyo") {
                position = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
            }
            Button("London") {
                position = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
                
            }
        }
       
//        let position = MapCameraPosition.region(
//            MKCoordinateRegion(
//                center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
//                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//            )
//        )
        // That value is only an initial position. If you want to change the position over time you'll need to mark it as @State then pass it in as a binding.
        

       // Map(initialPosition: position)
        
        
        //Map()
            .mapStyle(.hybrid)
         //   .mapStyle(.imagery)
        // .mapStyle(.hybrid(elevation: .realistic))
          
        /*:
         You can adjust how the user can work with your map, such as whether they can zoom or rotate their position. For example, we could make a map that always remains centered on a particular location, but users can still adjust the rotation and zoom:
         */
        //Map(interactionModes: [.rotate, .zoom])
        
        // Or we could specify no interaction modes, meaning that the map is always exactly fixed:
        // Map(interactionModes: [])
    }
}



#Preview {
    Mapping()
}

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

