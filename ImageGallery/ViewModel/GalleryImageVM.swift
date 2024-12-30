//
//  GalleryImageVM.swift
//  ImageGallery
//
//  Created by Charles on 30/12/24.
//

import Foundation


class GalleryImageVM:ObservableObject {
    
    @Published var galleryImageResponse:GalleryListResponse?
    
    func getGalleryListResponse() {
        APIManager.shared.getRequest(endPoint: APIEndPoint.search(qwery: "people")) { (result:Result<GalleryListResponse,NetworkError>) in
            switch result {
            case .success(let response):
                self.galleryImageResponse = response
                print(self.galleryImageResponse?.totalResults ?? 0)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
