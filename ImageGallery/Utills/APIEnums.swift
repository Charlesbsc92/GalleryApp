//
//  APIEnums.swift
//  ImageGallery
//
//  Created by Charles on 30/12/24.
//

import Foundation
import Alamofire


enum APIEndPoint {
    
    static let baseURL = "https://api.pexels.com/v1/"
    
    case search(qwery:String)
    
    var path:String {
        switch self {
        case .search(let qwery):
            return "search?query=\(qwery)"
        }
    }
    
    var method:HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var url:URL? {
        return URL(string: APIEndPoint.baseURL + path)
    }
}
