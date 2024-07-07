//
//  NavigationPathStorage.swift
//  Navigation
//
//  Created by Jennifer Lee on 7/7/24.
//

/*:
 https://www.hackingwithswift.com/books/ios-swiftui/how-to-save-navigationstack-paths-using-codable
 If you're using NavigationPath, you need only four small changes. See bottom

 
 */
import Foundation

@Observable
class PathStore {
    var path: [Int] {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }

        // Still here? Start with an empty path.
        path = []
    }

    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

/*:
 
 //First, the path property needs to have the type NavigationPath rather than [Int]:
 var path: NavigationPath {
     didSet {
         save()
     }
 }
 
 //Second, when we decode our JSON in the initializer we need to decode to a specific type, then use the decoded data to create a new NavigationPath:

 if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
     path = NavigationPath(decoded)
     return
 }
 
 //Third, if decoding fails we should assign a new, empty NavigationPath instance to the path property at the end of the initializer:
 
 path = NavigationPath()
 
 //And finally, the save() method needs to write the Codable representation of our navigation path. This is where things diverge just a little more from using a simple array, because NavigationPath doesn't require that its data types conform to Codable – it only needs Hashable conformance. As a result, Swift can't verify at compile time that there is a valid Codable representation of the navigation path, so we need to request it and see what comes back.
 
 //That means adding a check at the start of the save() method, which attempts to retrieve the Codable navigation path and bails out immediately if we get nothing back:

 guard let representation = path.codable else { return }
 
 //That will either return the data ready to be encoded to JSON, or return nil if at least one object in the path cannot be encoded.

 //Finally, we convert that Codable representation to JSON instead of the original Int array:

 let data = try JSONEncoder().encode(representation)
 */
/*:
 // SAMPLE CLASS
 
 
 @Observable
 class PathStore {
     var path: NavigationPath {
         didSet {
             save()
         }
     }

     private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

     init() {
         if let data = try? Data(contentsOf: savePath) {
             if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                 path = NavigationPath(decoded)
                 return
             }
         }

         // Still here? Start with an empty path.
         path = NavigationPath()
     }

     func save() {
         guard let representation = path.codable else { return }

         do {
             let data = try JSONEncoder().encode(representation)
             try data.write(to: savePath)
         } catch {
             print("Failed to save navigation data")
         }
     }
 }
 
 
 */
