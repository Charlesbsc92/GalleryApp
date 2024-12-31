//
//  ContentView.swift
//  ImageGallery
//
//  Created by Charles on 30/12/24.
//

import SwiftUI

struct GalleryView: View {
    
    @StateObject var viewModel:GalleryImageVM = GalleryImageVM()
    @State private var isLoading = false
    @State private var pageNumber:Int = 1
    
    
    let columns:[GridItem] = [GridItem(.flexible(),spacing: 0),
                              GridItem(.flexible(),spacing: 0),
                              GridItem(.flexible(),spacing: 0)]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                content
                if self.isLoading {
                    self.loadingIndicator
                }
            }
            .navigationTitle("Image Gallery")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.getGalleryListResponse(pageNumber: self.pageNumber)
            }
        }
        
    }
    
    private var content: some View {
        LazyVGrid(columns: columns,spacing: 1) {
            ForEach(0..<viewModel.galleryPhotos.count, id: \.self) { index  in
                gridItem(for: index)
            }
        }
    }
    
    private func gridItem(for item: Int) -> some View {
        AsyncImage(url: URL(string: viewModel.galleryPhotos[item].photoSource?.original ?? "")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: self.imageDimension(), height: 150)
        .onAppear {
            if item == viewModel.galleryPhotos.count - 1 {
                self.loadMoreItems()
            }
        }
    }
    
    private var loadingIndicator: some View {
        ProgressView("Loading...")
            .padding()
    }
    
    private func loadMoreItems() {
        guard !isLoading else { return }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.pageNumber += 1
            viewModel.getGalleryListResponse(pageNumber: self.pageNumber)
            isLoading = false
        }
    }

    func imageDimension() -> CGFloat {
        return (UIScreen.main.bounds.width / 3)
    }
}

#Preview {
    GalleryView()
}
