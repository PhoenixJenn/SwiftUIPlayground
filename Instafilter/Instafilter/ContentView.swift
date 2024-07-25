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
 
 https://www.hackingwithswift.com/books/ios-swiftui/customizing-our-filter-using-confirmationdialog
 
 PREVIEW CRASH
 https://www.hackingwithswift.com/forums/100-days-of-swift/day-54-instafilter-part-4-applying-filters-error-thread-1-exception-citwirldistortion-0x600002ccea00-setvalue-forundefinedkey-this-class-is-not-key-value-coding-compliant-for-the-key-inputintensity/1783
 
 []A NavigationStack so we can show our app’s name at the top.
 []A box prompting users to select a photo, over which we’ll place their imported picture.
 []An “Intensity” slider that will affect how strongly we apply our Core Image filters, stored as a value from 0.0 to 1.0.
 []A sharing button to export the processed image from the app.
 
 CHALLENGE
 https://www.hackingwithswift.com/books/ios-swiftui/instafilter-wrap-up
 Try making the Slider and Change Filter buttons disabled if there is no image selected.
 Experiment with having more than one slider, to control each of the input keys you care about. For example, you might have one for radius and one for intensity.
 Explore the range of available Core Image filters, and add any three of your choosing to the app.
 
 
 */
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import _PhotosUI_SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
   // @State private var currentFilter = CIFilter.sepiaTone()
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    
    @State private var showingFilters = false
    
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
                         
                        changeFilter()
                       
                    }

                    Spacer()

                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                // dialog here
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Cancel", role: .cancel) { }
            }
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
        showingFilters = true
    }
    
    func applyProcessing() {
        
        //currentFilter.intensity = Float(filterIntensity)
        
//        currentFilter.setValue( filterIntensity, forKey: kCIInputIntensityKey)
        
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
/*:
 Tip: For testing purposes, you should perhaps change the review condition from 20 down to 5 or so, just to make sure your code works the way you expect!
 */
        if filterCount >= 5 {
            requestReview()
        }
    }
    
    
}

#Preview {
    ContentView()
}
