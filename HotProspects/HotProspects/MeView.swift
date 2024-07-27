//
//  MeView.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//
// https://www.hackingwithswift.com/books/ios-swiftui/generating-and-scaling-up-a-qr-code

// https://www.hackingwithswift.com/books/ios-swiftui/adding-a-context-menu-to-an-image

// Long Press QR Code to Share

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MeView: View {
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAddress") private var emailAddress = "you@yoursite.com"
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    @State private var qrCode = UIImage()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)

                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .onAppear(perform: updateCode)
                    .onChange(of: name, updateCode)
                    .onChange(of: emailAddress, updateCode)
                    
                    .contextMenu {
                        ShareLink(item: Image(uiImage: qrCode), preview: SharePreview("My QR Code", image: Image(uiImage: qrCode)))
                    }
                //                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
            }
            .navigationTitle("Your code")
        }
    }
    
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
    }
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        // cache the QR Code
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    MeView()
}
