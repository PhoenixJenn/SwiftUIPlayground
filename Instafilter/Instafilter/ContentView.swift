//
//  ContentView.swift
//  Instafilter
//
//  Created by Jennifer Lee on 7/24/24.
//


/*:
 https://www.hackingwithswift.com/books/ios-swiftui/building-our-basic-ui
 https://www.hackingwithswift.com/books/ios-swiftui/importing-an-image-into-swiftui-using-photospicker
 https://www.hackingwithswift.com/books/ios-swiftui/basic-image-filtering-using-core-image
 
 []A NavigationStack so we can show our app’s name at the top.
 []A box prompting users to select a photo, over which we’ll place their imported picture.
 []An “Intensity” slider that will affect how strongly we apply our Core Image filters, stored as a value from 0.0 to 1.0.
 []A sharing button to export the processed image from the app.
 */
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import _PhotosUI_SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    
    @State private var currentFilter = CIFilter.sepiaTone()
    
    let context = CIContext()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer()
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get started"))
                    }
                }
                .onChange(of: selectedItem, loadImage)
                
                
                // image area
//                if let processedImage {
//                    processedImage
//                        .resizable()
//                        .scaledToFit()
//                } else {
//                    ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
//                }
                // image area ---

                Spacer()

                HStack {
                    Text("Intensity")
            
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                }
                .padding(.vertical)

                HStack {
                    Button("Change Filter") {
                        // change filter
                       
                    }

                    Spacer()

                    // share the picture
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        }
        
        
    }
    
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }

            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            
            applyProcessing()
        }
    }
    
    func changeFilter() {
    }
    
    func applyProcessing() {
        
        currentFilter.intensity = Float(filterIntensity)

        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    
}

#Preview {
    ContentView()
}
