//
//  Scratch.swift
//  GuessTheFlag
//
//  Created by Jennifer Lee on 6/13/24.
//

import SwiftUI

struct Scratch: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            Color.blue
            Spacer()
            
            Text("Your content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.red.gradient)
            
            
            //                .foregroundStyle(.secondary)
            //                        .padding(50)
            .background(.ultraThinMaterial)
        }
        VStack{
            HStack{
                Text("First one here")
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Second")
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Third")
                
                
                
    //            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
    //            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
                
              
                //That uses the thinnest material, which is means we’re letting a lot of the background colors shine through our frosted glass effect.
                
            }
            
        }
        ZStack {
            Image("niagara-falls")
            Text("Hacking with Swift")
                .font(.largeTitle)
                .background(.black)
                .foregroundStyle(.white)
        }
        
        
        HStack{
            
            Text("First")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Second")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Third")
        }
        
        
        ZStack(alignment: .top) {
            Color.yellow
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            //Color.primary is the default color of text in SwiftUI, and will be either black or white depending on whether the user’s device is running in light mode or dark mode
            //Color.secondary, which is also black or white depending on the device, but now has slight transparency so that a little of the color behind it shines through.
            Spacer()
            Text("Hello, world!")
                .background(.blue)
            Text("This is inside a stack")
                .background(.red)
            Spacer()
        }
        VStack{
            Color.red
            
        }
        VStack{
            LinearGradient(stops: [
                Gradient.Stop(color: .gray, location: 0.45),
                Gradient.Stop(color: .black, location: 0.55),
            ], startPoint: .top, endPoint: .bottom)
        }
            .ignoresSafeArea()
        
        
    } // body
}

#Preview {
    Scratch()
}
