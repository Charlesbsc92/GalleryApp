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
        
        Text("Will Soon integrated image like a gallery application.")
            .multilineTextAlignment(.center)
    }
}

#Preview {
    GalleryView()
}
