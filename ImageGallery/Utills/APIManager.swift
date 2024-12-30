//
//  APIManager.swift
//  ImageGallery
//
//  Created by Charles on 30/12/24.
//

import Alamofire

enum NetworkError:Error {
    case invalidURL
    case noData
    case decodingFailed
    case serverError(String)
}

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    
    func getRequest<T:Codable>(endPoint:APIEndPoint,completion:@escaping (Result<T,NetworkError>) -> Void) {
        guard let url = endPoint.url else {
            completion(.failure(.invalidURL))
            return
        }
        NetworkManager.getSessionManger().request(url,method: endPoint.method).responseData { dataResponse in
            guard let data = dataResponse.data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch let error {
                completion(.failure(.serverError(error.localizedDescription)))
            }
        }
    }
    
    
    
    
}
