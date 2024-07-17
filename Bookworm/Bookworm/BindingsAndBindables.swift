//
//  BindingsAndBindables.swift
//  Bookworm
//
//  Created by Jennifer Lee on 7/16/24.
//

/*:
 https://www.hackingwithswift.com/books/ios-swiftui/creating-a-custom-component-with-binding
 This is the power of @Binding: as far as the button is concerned it’s just toggling a Boolean – it has no idea that something else is monitoring that Boolean and acting upon changes.
 */
import SwiftUI

struct BindingsAndBindables: View {
    @State private var rememberMe = false

    var body: some View {
        VStack {
            
                PushButton(title: "Remember Me", isOn: $rememberMe) // added $ so 2way binding
                //PushButton(title: "Remember Me", isOn: rememberMe)
                Text(rememberMe ? "On" : "Off")
                }
    }
    
    
}

#Preview {
    BindingsAndBindables()
}


struct PushButton: View {
    let title: String
   
    @Binding var isOn: Bool // now we share 2 way with contentview

    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]

    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}
