//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Jennifer Lee on 7/26/24.
// https://www.hackingwithswift.com/books/ios-swiftui/identifying-views-with-useful-labels
// https://www.twilio.com/en-us/blog/how-to-test-your-ios-application-on-a-real-device-html
// https://developer.apple.com/documentation/xcode/distributing-your-app-to-registered-devices
// https://www.hackingwithswift.com/books/ios-swiftui/hiding-and-grouping-accessibility-data

/*:
 CHALLENGE
 Fixing other projects
 
 https://www.hackingwithswift.com/100/swiftui/75
 
[]https://www.hackingwithswift.com/books/ios-swiftui/handling-voice-input-in-swiftui
[] https://www.hackingwithswift.com/books/ios-swiftui/fixing-guess-the-flag
[] https://www.hackingwithswift.com/books/ios-swiftui/fixing-word-scramble
[] https://www.hackingwithswift.com/books/ios-swiftui/fixing-bookworm
 
 
 */
import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]

    @State private var selectedPicture = Int.random(in: 0...3)

    var body: some View {
        Spacer()
//        VStack {
//            Text("Your score is")
//            Text("1000")
//                .font(.title)
//        }.accessibilityElement(children: .combine)
        
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
        
        
//        Image(pictures[selectedPicture])
//            .resizable()
//            .scaledToFit()
//            .onTapGesture {
//                selectedPicture = Int.random(in: 0...3)
//            }
//            .accessibilityLabel(labels[selectedPicture])
//            .accessibilityAddTraits(.isButton)
//            .accessibilityRemoveTraits(.isImage)
        
        // tells SwiftUI it should be ignored by VoiceOver.
        //Image(decorative: "character")
        
        Image(.character)
            .accessibilityHidden(true)
        //Better
        Button {
            selectedPicture = Int.random(in: 0...3)
        } label: {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
        }
        .accessibilityLabel(labels[selectedPicture])
        
    }
    
    
}

#Preview {
    ContentView()
}
