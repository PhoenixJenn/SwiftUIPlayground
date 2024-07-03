//
//  FontsAndFormatting.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/3/24.
//

// https://www.swiftyplace.com/blog/swiftui-font-and-texts

import SwiftUI

struct FontsAndFormatting: View {
    // You can access the dynamic type size settings in SwiftUI from the environment:
    // This is an enum with all of the values you can see above in the settings app:
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    // You can also check if ´larger accessibility sizes´ is enabled:
    // dynamicTypeSize.isAccessibilitySize

    @State private var isBold = false
    
    var body: some View {
        
        
        
        VStack(alignment: .leading, spacing: 10) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.red)
            
                    VStack(alignment: .leading, spacing: 10) {
                        HStack{
                            Text("pattern       dot")
                                .strikethrough(pattern: .dot)
                            Text("color pink")
                               .strikethrough(pattern: .dash, color: .pink)
                            Text("pattern dot")
                               .underline(pattern: .dot, color: .accentColor)
                        }
                        HStack{
                            Text("bold").bold(isBold)
                            Button("<< Make Bold") {
                               isBold.toggle()
                            }
                            Text("vs bold tag").bold() // new .bold(false)
                        }
                       
                        
                        HStack{
                            Text("Large Title > ").font(.largeTitle)
                            Text("Title").font(.title)
                        }
                        
                        HStack{
                            Text("Title2 > ").font(.title2) // available iOS 14
                            Text("Title3").font(.title3) // available iOS 14
                                .fontWeight(.bold)
                        }
                        Divider()
                        

                        Divider()
                        HStack{
                            Text("Headline").font(.headline)
                            Text("Subheadline").font(.subheadline)
                        }
                        
                    }

                    Divider()

                    VStack(alignment: .leading, spacing: 10) {
                        HStack{
                            Text("Body").font(.body)  // --> default font
                            Text("Callout").font(.callout)
                            Text("Footnote").font(.footnote)
                        }
                        HStack{
                            Text("Caption").font(.caption)
                            Text("Caption2").font(.caption2) // available iOS 14
                        }
                       
                    }
  
                }
        
        
        VStack(alignment: .leading, spacing: 10) {
            Text("design: .default size 18, font weigth medium")
                .font(.system(size: 18, weight: .regular, design: .default))
            HStack{
                Text("design: .default")
                    .font(.system(.body, design: .default))

                Text("design: .serif")
                    .font(.system(.body, design: .serif))
            }
            HStack{
                Text("design: .monospaced")
                    .font(.system(.body, design: .monospaced))

                Text("design: .rounded")
                    .font(.system(.body, design: .rounded))

            }

                   
                    Text("design: .rounded, font weight: heavy")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.heavy)
            
            //.font(.system(size: 18, weight: .regular, design: .default))
                }
        
        HStack{
            Text("Italicized Text")
               .italic()
            Text("Underlined Text")
               .underline()
            Text("Strikethrough Text")
               .strikethrough()
        }
        
        VStack(alignment: .leading, spacing: 10) {
            Divider()
                    HStack{
                        Text("Ultra Light Font")
                            .fontWeight(.ultraLight)
                        Text("Thin Font")
                            .fontWeight(.thin)
                        Text("Light Font")
                            .fontWeight(.light)
                            
                    }
                    HStack{
                        Text("Regular Font")
                            .fontWeight(.regular)
                        Text("Medium Font")
                            .fontWeight(.medium)
                    }
                    HStack{
                        Text("Semibold Font")
                            .fontWeight(.semibold)
                        Text("Bold Font")
                            .fontWeight(.bold)
                        Text("Heavy Font")
                            .fontWeight(.heavy)
                        Text("Black Font")
                            .fontWeight(.black)
                    }
                    
            Divider()
                }
                .padding().padding(.bottom, 10)
      
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
        Divider()
        HStack {
                Text("some text")
                Text("baselineOffset").baselineOffset(15)
                Text("set")
                Text("to").baselineOffset(15).underline()
                Text("15").underline()
        }
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

        }
        
    }
    
    /*:
     switch dynamicTypeSize {
         case .xSmall:

         case .small:

         case .medium:

         case .large:

         case .xLarge:

         case .xxLarge:

         case .xxxLarge:

         case .accessibility1:

         case .accessibility2:

         case .accessibility3:

         case .accessibility4:

         case .accessibility5:

     }
     */
}

#Preview {
    FontsAndFormatting()
}
