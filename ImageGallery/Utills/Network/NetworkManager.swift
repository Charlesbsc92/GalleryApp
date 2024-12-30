//
//  NetworkManager.swift
//  OORCabs
//
//  Created by Tart Labs on 08/03/19.
//  Copyright © 2019 Tart Labs. All rights reserved.
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
