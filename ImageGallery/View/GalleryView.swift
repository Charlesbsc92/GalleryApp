//
//  ContentView.swift
//  ImageGallery
//
//  Created by Charles on 30/12/24.
//

import SwiftUI

struct GalleryView: View {
    
    @StateObject var viewModel:GalleryImageVM = GalleryImageVM()
    
    let columns:[GridItem] = [GridItem(.flexible(),spacing: 0),GridItem(.flexible(),spacing: 0),GridItem(.flexible(),spacing: 0)]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns,spacing: 0) {
                    ForEach(0..<viewModel.galleryPhotos.count, id: \.self) { index  in
                        AsyncImage(url: URL(string: viewModel.galleryPhotos[index].photoSource?.original ?? "")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: self.imageDimension(), height: 150)
                        .onTapGesture {
                            print("Tap on the images")
                        }
                    }
                }
            }
            .navigationTitle("Image Gallery")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.getGalleryListResponse()
            }
        }
        
    }
    
    func imageDimension() -> CGFloat {
        return UIScreen.main.bounds.width / 3
    }
}

#Preview {
    GalleryView()
}
