//
//  Created by Charles on 30/12/24.
//


import Foundation
import Alamofire

class NetworkManager {
    
    static var shared = NetworkManager()
    
    let sessionManager:AuthSessionManager
    
    private init() {
        let oauthHandler = OAuth2Handler()
        sessionManager = oauthHandler.getSessionManager()
    }
    
    public static func getSessionManger() -> Session {
        return shared.sessionManager
    }
    
    public static func refreshNetworkManager() {
        shared = NetworkManager()
    }
    
}
