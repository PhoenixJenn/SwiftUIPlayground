//
//  GeoReader.swift
//  LayoutAndGeometry
//
//  Created by Jennifer Lee on 7/30/24.
// https://www.hackingwithswift.com/books/ios-swiftui/resizing-images-to-fit-the-screen-using-geometryreader

import SwiftUI

struct GeoReader: View {
    var body: some View {
        // original
//                Image(.jennGitHub)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 300)
        
        Text("Some text here!")
            .frame(width:100, height:100)
            .background(.yellow)
        Spacer()
        Text("Some text here)")
            .background(.gray)
        
        //scales the image
        GeometryReader { proxy in
            Image(.jennGitHub)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.8)
                .frame(width: proxy.size.width, height: proxy.size.height)
        }
        
        
        Text("Some text here!!! ")
            .frame(width:300, height:300)
            .background(.red)
            .padding(20)
        Spacer()
        Text("Some text here-----")
            .background(.blue)
        
        // This doesn't work well, doesn't divide the space
//        HStack {
//            Text("IMPORTANT")
//                .frame(width: 200)
//                .background(.blue)
//
//            Image(.jennGitHub)
//                .resizable()
//                .scaledToFit()
//                .containerRelativeFrame(.horizontal) { size, axis in
//                    size * 0.8
//                }
//        }

        //On the other hand, using a GeometryReader will subdivide the space correctly:
        //Of course, that introduces a different problem: our image is now aligned to the top-left corner of the GeometryReader!
//        HStack {
//            Text("IMPORTANT")
//                            .frame(width: 200)
//                            .background(.blue)
//            GeometryReader { proxy in
//                Image(.jennGitHub)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: proxy.size.width * 0.8)
//            }
//        }
        
       
        
//        GeometryReader { proxy in
//            Image(.jennGitHub)
//                .resizable()
//                .scaledToFit()
//                .frame(width: proxy.size.width * 0.8, height: 300)
//        }
        
//        GeometryReader { proxy in
//            Image(.jennGitHub)
//                .resizable()
//                .scaledToFit()
//                .frame(width: proxy.size.width * 0.8)
//        }

        /*:
         Now, you're probably wondering how this is any different from using containerRelativeFrame(). Well, the problem is that containerRelativeFrame() has a very precise definition of what constitutes a "container": it might be the whole screen, it might be a NavigationStack, it might be a List or a ScrollView, and so on, but it won't consider a HStack or a VStack a container.
         */
        
    }
    
}

#Preview {
    GeoReader()
}
