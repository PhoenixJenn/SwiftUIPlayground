//
//  TestNavCode.swift
//  Navigation
//
//  Created by Jennifer Lee on 7/7/24.
//

/*:
 when you're dealing with dynamic data – when you have lots of different integers to show in the same way, for example – SwiftUI gives us a better solution: attaching a presentation value to our navigation link.
 https://www.hackingwithswift.com/books/ios-swiftui/the-problem-with-a-simple-navigationlink
 
 
 But for more advanced navigation, it's better to separate the destination from the value. This allows SwiftUI to load the destination only when it's needed.

 Doing this takes two steps:

 We attach a value to the NavigationLink. This value can be anything you want – a string, an integer, a custom struct instance, or whatever. However, there is one requirement: whatever type you use must conform to a protocol called Hashable.
 Attaching a navigationDestination() modifier inside the navigation stack, telling it what to do when it receives your data.

 
 */
import SwiftUI

struct TestNavCode: View {
    var body: some View {
        
        
        NavigationStack {
            NavigationLink("Tap Me") {
               // Text("Detail View")
                //for more advanced navigation, it's better to separate the destination from the value. This allows SwiftUI to load the destination only when it's needed.
                DetailView(number: 556)
            }
//            List(0..<10) { i in
//                    NavigationLink("Tap Me") {
//                        DetailView(number: i)
//                    }
//                }
        }
        
        
    }
}


struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

// we could use Student as navigation because we added Hashable

//struct Student: Hashable {
//    var id = UUID()
//    var name: String
//    var age: Int
//}


#Preview {
    TestNavCode()
}
