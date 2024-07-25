//
//  PickMultiPhotos.swift
//  Instafilter
//
//  Created by Jennifer Lee on 7/25/24.
//

import SwiftUI
import PhotosUI


struct PickMultiPhotos: View {
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack{
            Divider()
            
            
//            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .images) {
//                Label("Select a picture", systemImage: "photo")
//            }
            
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }
            Divider()
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            
            
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()

                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    PickMultiPhotos()
}
