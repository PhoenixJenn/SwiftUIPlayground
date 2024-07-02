//
//  UsingModifiers.swift
//  ViewsAndModifiers
//
//  Created by Jennifer Lee on 6/15/24.
//

import SwiftUI

struct UsingModifiers: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
        Text("Using a Modifier called modifier")
            .modifier(Title()) // using a modifier named modifier
        
        
        Text("MODIFIER extension")
            .titleStyle() // using a modifier with an extension
        
        Section("Using Structs") {
            CapsuleText(text: "First Capsule")
                .foregroundStyle(.yellow)
            CapsuleText(text: "Second Capsule")
        }
        
        
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
        
    }
}


// Title Modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.mint)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
// ---------------

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

// ----------------
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}



#Preview {
    UsingModifiers()
}
