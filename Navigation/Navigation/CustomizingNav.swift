//
//  CustomizingNav.swift
//  Navigation
//
//  Created by Jennifer Lee on 7/8/24.
//
/*:
 .confirmationAction, when you want users to agree to something, such as agreeing to terms of service.
 .destructiveAction, when the user needs to make a choice to destroy whatever it is they are working with, such as confirming they want to remove some data they created.
 .cancellationAction, when the user needs to back out of changes they have made, such as discarding changes they have made.
 .navigation, which is used for buttons that make the user move between data, such as going back and forward in a web browser.
 
 Tip: If you need the user to decide between saving a change or discarding it, you might want to add the navigationBarBackButtonHidden() modifier so that they can't tap Back to exit without making a choice.
 */

import SwiftUI

struct CustomizingNav: View {
    
    @State private var title = "SwiftUI"

    
    
    var body: some View {
        
        
                        
        
        
        NavigationStack {
            Text("Hello, world!")
                //.navigationTitle("SwiftUI")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
              
                .toolbar {
                    
                    ToolbarItemGroup(placement: .topBarLeading) {
                            Button("Tap Me") {
                                // button action here
                            }

                            Button("Tap Me 2") {
                                // button action here
                            }
                        }
                    
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button("Tap Me") {
//                            // button action here
//                        }
//                    }
//                    ToolbarItem(placement: .topBarLeading) {
//                            Button("Tap Me 2") {
//                                // button action here
//                            }
//                        }
//
//                        ToolbarItem(placement: .topBarLeading) {
//                            Button("Or Tap Me") {
//                                // button action here
//                            }
//                        }
                    
                }
        }
        
//        NavigationStack {
//            List(0..<100) { i in
//                Text("Row \(i)")
//            }
//            .navigationTitle("Title goes here")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(.blue)
//            .toolbarColorScheme(.dark)
//           // .toolbar(.hidden, for: .navigationBar)
//            /*:
//             
//             Hiding the toolbar won't stop you from navigating to new views, but i
//             */
//        } //nav stack
        
        
        
       
        
        
        
        
        
    }
}

#Preview {
    CustomizingNav()
}
