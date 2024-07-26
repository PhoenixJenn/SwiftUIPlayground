//
//  ImageInterpolation.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//

import SwiftUI

struct ImageInterpolation: View {
    var body: some View {
        Image(.example)
            .interpolation(.none) // fixes jagged blurry
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageInterpolation()
}
