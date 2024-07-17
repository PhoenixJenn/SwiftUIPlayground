//
//  RatingView.swift
//  Bookworm
//
//  Created by Jennifer Lee on 7/17/24.
//
/*:
 The off and on images, which dictate the images to use when the star is highlighted or not (default: nil for the off image, and a filled star for the on image; if we find nil in the off image we’ll use the on image there too)
 
 */
import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?  //default nil
    
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage  // nil coalescing,
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}



