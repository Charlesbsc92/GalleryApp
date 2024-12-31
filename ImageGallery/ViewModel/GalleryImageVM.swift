//
//  GalleryImageVM.swift
//  ImageGallery
//
//  Created by Charles on 30/12/24.
//

import Foundation


class GalleryImageVM:ObservableObject {
    
    @Published var galleryPhotos:[Photo] = []
    
    
    func getGalleryListResponse() {
        APIManager.shared.getRequest(endPoint: APIEndPoint.search(qwery: "people",page: 1,perPage: 25)) { (result:Result<GalleryListResponse,NetworkError>) in
            switch result {
            case .success(let response):
                self.galleryPhotos.append(contentsOf: response.getPhotos())
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
