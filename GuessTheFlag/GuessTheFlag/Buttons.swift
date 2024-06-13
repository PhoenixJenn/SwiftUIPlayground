//
//  Buttons.swift
//  GuessTheFlag
//
//  Created by Jennifer Lee on 6/13/24.
//

import SwiftUI

struct Buttons: View {
    
    @State private var showingAlert = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    
    
    var body: some View {
       
        VStack{
            Button("Button 1") { }
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive) { }
                    .buttonStyle(.bordered)
                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
            Button("Delete selection", role: .destructive, action: deleteStuff)
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
            }
            // Image("pencil") will load an image called “Pencil” that you have added to your project.
            //Image(decorative: "pencil") will load the same image, but won’t read it out for users who have enabled the screen reader. This is useful for images that don’t convey additional important information.
            Button("Edit", systemImage: "pencil") {
                print("Edit button was tapped")
            }
            
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            
            
            
            Spacer()
            Button("Show Alert") {
                        showingAlert = true
                    }
                    .alert("Important message", isPresented: $showingAlert) {
                        Button("OK") {
                            // nothing needed here because it dismissees the alert
                        }
                    }
            
            Spacer()
            Button("Some Stuff"){
                showingAlert2 = true
            }
                .alert("Important message", isPresented: $showingAlert2) {
                    Button("Delete", role: .destructive) { }
                    Button("Cancel", role: .cancel) { }
                }
            
            Spacer()
            
            Button("Show Alert Again") {
                showingAlert3 = true
            }
            
                .alert("Important message", isPresented: $showingAlert3) {
                    Button("OK", role: .cancel) {
                        // nothing needed here because it dismissees the alert
                    }
            } message: {
                Text("Please read this.")
            }
        }
        
        
    
    } // form
    func deleteStuff(){
        print("Now deleting…")
    }
}

#Preview {
    Buttons()
}
