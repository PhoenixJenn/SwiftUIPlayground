//
//  UserDefaults.swift
//  iExpense
//
//  Created by Jennifer Lee on 7/2/24.
//

import SwiftUI
import Foundation

struct UserDefaults: View {
    @State private var tapCount = Foundation.UserDefaults.standard.integer(forKey: "Tap")
    
    func doNothing(){
        // do nothing
    }
    
    var body: some View {
      
        VStack{
            Button("Tap count: \(tapCount)") {
                tapCount += 1
                
                Foundation.UserDefaults.standard.set(tapCount, forKey: "Tap")
            }
            
            
            Button(action: doNothing) {
                Label("Add Folder", systemImage: "folder.badge.plus")
            }
        }
        
    }
}

#Preview {
    UserDefaults()
}
