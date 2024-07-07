//
//  Sandbox.swift
//  Navigation
//
//  Created by Jennifer Lee on 7/7/24.
//

import SwiftUI

// creates endless views
// https://www.hackingwithswift.com/books/ios-swiftui/how-to-make-a-navigationstack-return-to-its-root-view-programmatically

/*:
 You've seen how @State lets us create some storage inside our view, so we can modify values while our app is running. The @Binding property wrapper lets us pass an @State property into another view and modify it from there – we can share an @State property in several places, and changing it in one place will change it everywhere.
 */
struct Sandbox: View {
    @State private var path = [Int]()
    
    var body: some View {
        
        
        Text("Hello")
        NavigationStack(path: $path) {
                    DetailView2(number: 0, path: $path)
                        .navigationDestination(for: Int.self) { i in
                            DetailView2(number: i, path: $path)
                        }
                }
        
    }
}

/*:
 
 And if you're using NavigationPath you'd use this:

 .toolbar {
     Button("Home") {
         path = NavigationPath()
     }
 }
 */
struct DetailView2: View {
    //Sharing a binding like this is common – it's exactly how TextField, Stepper, and other controls work.
    var number: Int
    @Binding var path: [Int]

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
        
            .toolbar {
                Button("Home") {
                    path.removeAll()
                }
            }
    }
}

/*:
 
 Now, if you're 10 views deep in there and decide you want to return home you have two options:

 If you're using a simple array for your path, like we're doing in the code above, you can call removeAll() on that array to remove everything in your path, going back to the root view.
 If you're using NavigationPath for your path, you can set it to a new, empty instance of NavigationPath, like this: path = NavigationPath().
 */
#Preview {
    Sandbox()
}
