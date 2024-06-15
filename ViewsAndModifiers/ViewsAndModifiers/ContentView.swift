//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jennifer Lee on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var useRedText : Bool = false
    @State private var scale: CGFloat = 1
    @State private var animationAmount = 1.0
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        Spacer()
        VStack{
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
            
           
        }
        // using view modifiers
        // https://developer.apple.com/documentation/swiftui/configuring-views
        
        // "environment modifier" -> can apply formatting to all 4 text views simultaneously
        VStack {
            Spacer()
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
                .blur(radius: 3)
            Text("Ravenclaw").animation(.linear(duration: 2))
            Text("Slytherin")
        }
        .font(.title)
        
        Button("Tap Me") {
               animationAmount += 1
           }
           .padding(25)
           .background(.red)
           .foregroundStyle(.white)
           .clipShape(.circle)
           .scaleEffect(animationAmount)
           .animation(.easeInOut(duration: 2), value: animationAmount)
        
//        Button("Tap me") {
//            scale += 1
//        }.scaleEffect(scale)
//        .animation(.default)
        
        HStack {
            //let _ = print("Update SpyView")
            let _ = Self._printChanges()
            
            Button("Hello World") {  // flip the Boolean between true and false
                useRedText.toggle()
            }
                .foregroundStyle(useRedText ? .red : .blue)
            
            Button("Hello, world!") { // do nothing
            }
            .background(.white)
            .frame(width: 100, height: 40)
            
            Button("Hello, world!") {
                print(type(of: self.body))
            }
            .frame(width: 150, height: 40)
            .background(.red)
            
            
        } // Vstack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange)
        
        
        Group {
                Text("Lumos")
                Text("Obliviate")
              
            }
        VStack{
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
            
           
            
           
        }
    }
}







#Preview {
    ContentView()
}
