//
//  LoadingViews.swift
//  BucketList
//
//  Created by Jennifer Lee on 7/25/24.
//

import SwiftUI

struct LoadingViews: View {
  
        enum LoadingState {
            case loading, success, failed
        }
        @State private var loadingState = LoadingState.loading

var body: some View {
            Button("Read and Write") {
                let data = Data("Test Message".utf8)
                let url = URL.documentsDirectory.appending(path: "message.txt")

                do {
                    try data.write(to: url, options: [.atomic, .completeFileProtection])
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
        //        if loadingState == .loading {
        //            LoadingView()
        //        } else if loadingState == .success {
        //            SuccessView()
        //        } else if loadingState == .failed {
        //            FailedView()
        //        }
            switch loadingState {
                case .loading:
                    LoadingView()
                case .success:
                    SuccessView()
                case .failed:
                    FailedView()
            }
            /*:
             Where conditional views are particularly useful is when we want to show one of several different states, and if we plan it correctly we can keep our view code small and also easy to maintain – it’s a great way to start training your brain to think about SwiftUI architecture.
             */
            
        //        if Bool.random() {
        //            Rectangle()
        //        } else {
        //            Circle()
        //        }
            
    
    }
}

#Preview {
    LoadingViews()
}



struct LoadingView: View {
var body: some View {
    Text("Loading...")
}
}

struct SuccessView: View {
var body: some View {
    Text("Success!")
}
}

struct FailedView: View {
var body: some View {
    Text("Failed.")
}
}
