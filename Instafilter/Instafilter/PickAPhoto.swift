//
//  PickAPhoto.swift
//  Instafilter
//
//  Created by Jennifer Lee on 7/25/24.
//
import PhotosUI
import SwiftUI

struct PickAPhoto: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?

    
    var body: some View {
        VStack {
            selectedImage?
                .resizable()
                .scaledToFit()
            
            Divider()
            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
        }.onChange(of: pickerItem) {
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }

    }
}

#Preview {
    PickAPhoto()
}
