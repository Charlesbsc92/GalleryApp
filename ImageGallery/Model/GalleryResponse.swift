//
//  GalleryResponse.swift
//  ImageGallery
//
//  Created by Charles on 30/12/24.
//

import SwiftUI


struct GalleryListResponse:Codable {
    var page:Int
    var perPage:Int
    var photos:[Photo]
    var totalResults:Int
    var nextPage:String
    
    enum CodingKeys:String,CodingKey {
        case page = "page"
        case perPage = "per_page"
        case photos = "photos"
        case totalResults = "total_results"
        case nextPage = "next_page"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = container.safeDecodeValue(forKey: .page)
        self.perPage = container.safeDecodeValue(forKey: .perPage)
        self.photos = container.safeDecodeValue(forKey: .photos)
        self.totalResults = container.safeDecodeValue(forKey: .totalResults)
        self.nextPage = container.safeDecodeValue(forKey: .nextPage)
    }
    
    func getPhotos() -> [Photo] {
        return self.photos
    }
}



struct Photo:Codable {
    var id:Int
    var width:Int
    var height:Int
    var photoUrl:String
    
    enum Codingkeys:String,CodingKey {
        case id = "id"
        case width = "width"
        case height = "height"
        case url = "url"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: Codingkeys.self)
        self.id = container.safeDecodeValue(forKey: .id)
        self.width = container.safeDecodeValue(forKey: .width)
        self.height = container.safeDecodeValue(forKey: .height)
        self.photoUrl = container.safeDecodeValue(forKey: .url)
    }
}
