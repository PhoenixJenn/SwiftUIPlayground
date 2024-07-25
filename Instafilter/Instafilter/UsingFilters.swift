//
//  UsingFilters.swift
//  Instafilter
//
//  Created by Jennifer Lee on 7/24/24.
//

import SwiftUI

struct UsingFilters: View {
    @State private var image: Image?

        var body: some View {
            VStack {
                image?
                    .resizable()
                    .scaledToFit()
            }
            .onAppear(perform: loadImage)
        }

    func loadImage() {
        let inputImage = UIImage(resource: .curiousity)
        let beginImage = CIImage(image: inputImage)

        let context = CIContext()
        
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.inputImage = beginImage
//        currentFilter.scale = 100
        
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1
//
        
//        let currentFilter = CIFilter.twirlDistortion()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 1000
//        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        
        //get a CIImage from our filter or exit if that fails
       guard let outputImage = currentFilter.outputImage else { return }

       // attempt to get a CGImage from our CIImage
       guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

       // convert that to a UIImage
       let uiImage = UIImage(cgImage: cgImage)

       // and convert that to a SwiftUI image
       image = Image(uiImage: uiImage)
    }
//        func loadImage() {
//            image = Image(.curiousity)
//        }

}

#Preview {
    UsingFilters()
}
