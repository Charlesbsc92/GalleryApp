//
//  Created by Charles on 30/12/24.
//


import Foundation
import Alamofire

class OAuth2Handler {
   
    
    private let sessionManager: AuthSessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = .none
        return AuthSessionManager(configuration: configuration,interceptor: NetworkInceptor())
    }()
    
    
    // MARK: - RequestAdapter
    
    public func getSessionManager() -> AuthSessionManager {
        return self.sessionManager
    }
}

class NetworkInceptor:RequestInterceptor,@unchecked Sendable  {
    public func adapt(_ urlRequest: URLRequest, for session: Alamofire.Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var resurlRequest = urlRequest
        resurlRequest.setValue("Put your Api here", forHTTPHeaderField: "Authorization")
        completion(.success(resurlRequest))
    }
    
    public func retry(_ request: Alamofire.Request, for session: Alamofire.Session, dueTo error: Error, completion: @escaping (Alamofire.RetryResult) -> Void) {
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            // invalid login event
            completion(.doNotRetry)
        } else {
            completion(.doNotRetry)
        }
    }
}

public class AuthSessionManager:Session,@unchecked Sendable {
    
    public func request(_ url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> DataRequest {
        var authRequest = super.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        authRequest = authRequest.validate(statusCode: 200...400)
        return authRequest
    }
}

