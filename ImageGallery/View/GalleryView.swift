//
//  ContentView.swift
//  ImageGallery
//
//  Created by Charles on 30/12/24.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello,Charles Welcome to the world")
        }
        .padding()
    }
}

#Preview {
    GalleryView()
}
