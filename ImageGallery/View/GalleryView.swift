//
//  ContentView.swift
//  ImageGallery
//
//  Created by Charles on 30/12/24.
//

import SwiftUI

struct GalleryView: View {
    
    @StateObject var viewModel:GalleryImageVM = GalleryImageVM()
    
    var body: some View {
        VStack {
            Text("\(viewModel.galleryImageResponse?.totalResults ??  0)")
        }
        .onAppear {
            viewModel.getGalleryListResponse()
        }
    }
}

#Preview {
    GalleryView()
}
