//
//  ContentView.swift
//  BucketList
//
//  Created by Jennifer Lee on 7/25/24.
//

/*:
 Before we move on, here’s a small challenge for you: back in project 8 we looked at how to create a generic extension on Bundle that let us find, load, and decode any Codable data from our app bundle. Can you write something similar for the documents directory, perhaps making it an extension on FileManager?
 https://www.hackingwithswift.com/books/ios-swiftui/writing-data-to-the-documents-directory

 Refactor to use MVVM design pattern
 https://www.hackingwithswift.com/100/swiftui/72
 
 
 Challenge
 []One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on.

 []Allow the user to switch map modes, between the standard mode and hybrid.
 []Our app silently fails when errors occur during biometric authentication, so add code to show those errors in an alert.
 []Create another view model, this time for EditView. What you put in the view model is down to you, but I would recommend leaving dismiss and onSave in the view itself – the former uses the environment, which can only be read by the view, and the latter doesn’t really add anything when moved into the model.
 Tip: That last challenge will require you to make a State instance in your EditView initializer – remember to use an underscore with the property name!
 
 
 */
import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var viewModel = ViewModel()
  

    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        if viewModel.isUnlocked {
            //https://www.hackingwithswift.com/books/ios-swiftui/locking-our-ui-behind-face-id
            Text("Hello World")
            MapReader { proxy in
                Map(initialPosition: startPosition) {
                    ForEach(viewModel.locations) { location in
                        Annotation(location.name, coordinate: location.coordinate) {
                         
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                                .onLongPressGesture {
                                    viewModel.selectedPlace = location
                                }
                        }
                    }
                }
                .sheet(item: $viewModel.selectedPlace) { place in
                    
                    EditView(location: place) {
                        viewModel.update(location: $0)
                    }

                }
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        viewModel.addLocation(at: coordinate)
                    }
                } //ontap

            } // MapReader
            
            
        } else {
            Text("Hello World")
            // button here
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
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

