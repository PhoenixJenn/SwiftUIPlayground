//
//  UsingTimers.swift
//  Flashzilla
//
//  Created by Jennifer Lee on 7/29/24.
//

// https://www.hackingwithswift.com/books/ios-swiftui/triggering-events-repeatedly-using-a-timer

import SwiftUI

struct UsingTimers: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        @State private var counter = 0

        var body: some View {
            Text("Hello, World!")
                .onReceive(timer) { time in
                    if counter == 5 {
                        print("CANCEL")
                        timer.upstream.connect().cancel()
                    } else {
                        print("The time is NOW \(time)")
                    }

                    counter += 1
                }
        }
 
    
}

#Preview {
    UsingTimers()
}
