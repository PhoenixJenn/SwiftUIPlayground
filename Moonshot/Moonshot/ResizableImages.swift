//
//  ResizableImages.swift
//  Moonshot
//
//  Created by Jennifer Lee on 7/5/24.
//

import SwiftUI

struct ResizableImages: View {
    var body: some View {
        VStack {
            Image(.geek)
                .resizable()
                .scaledToFit() // ok to leave parts empty
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
               // .scaledToFill() // fill entire frame with photo even if some parts hang out
              //  .frame(width: 300, height: 300)
                
                //.clipped()
        } // Vstack
        .padding()
    }
}

#Preview {
    ResizableImages()
}
