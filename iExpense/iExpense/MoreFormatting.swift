//
//  MoreFormatting.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/15/24.
//

import SwiftUI

struct MoreFormatting: View {
    var body: some View {
        ForEach(namedFonts) { namedFont in
            Text(namedFont.name)
                .font(namedFont.font)
        }
        Divider()
        HStack{
            Text("American Typewriter")
                .font(.custom("AmericanTypewriter", size: 18))
            Text("Copperplate")
                .font(.custom("Copperplate", size: 18))
            Text("Cochin font - fixedSize 18")
                .font(.custom("Cochin", fixedSize: 18)) // available iOS 14 and macOS 11
            Text("Cochin font - size 18")
                .font(.custom("Cochin", size: 18))
            Text("Cochin font - fixedSize 18 - relativeTo body")
                .font(.custom("Cochin", size: 18, relativeTo: .body)) // available iOS 14 and macOS 11

        } // Hstack
        Divider()
        HStack(alignment: .firstTextBaseline) {
            Text("set text width")

            VStack(alignment: .leading, spacing: 5) {
                HStack{
                    Text("expanded")
                        .fontWidth(.expanded)
                    Text("standard")
                        .fontWidth(.standard)
                    Text("condensed")
                        .fontWidth(.condensed)
                    Text("compressed")
                        .fontWidth(.compressed)
                }
              
            }
        }
        Divider()
        HStack {
                Text("some text")
                Text("baselineOffset").baselineOffset(15)
                Text("set")
                Text("to").baselineOffset(15).underline()
                Text("15").underline()
        }
        
        Divider()
        
        HStack {
            VStack(alignment: .leading) {
                Text("default")
                Text("monospacedDigit").monospacedDigit()
            }

            VStack(alignment: .leading) {
                Text("1234567890")
                Text("1234567890").monospacedDigit()
            }
            VStack{
                Text("Kerning Text - 2")
                .kerning(2)
                Text("Tracking Text - 2")
                .tracking(2)
            }
        }
    }
}

private struct NamedFont: Identifiable {
    let name: String
    let font: Font
    var id: String { name }
}


private let namedFonts: [NamedFont] = [
    NamedFont(name: "Large Title", font: .largeTitle),
    NamedFont(name: "Title", font: .title),
    NamedFont(name: "Headline", font: .headline),
    NamedFont(name: "Body", font: .body),
    NamedFont(name: "Caption", font: .caption)
]




#Preview {
    MoreFormatting()
}
