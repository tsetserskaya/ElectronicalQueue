//
//  Login.swift
//  Centtrip
//
//  Created by Sviatoslav Semeniuk on 15/01/2016.
//  Copyright © 2016 Andrey Chuprina. All rights reserved.
//

import UIKit
import RestKit
import FXKeychain

let apiTokenKey = "com.queue.User-Token"

class Login: NSObject {

    var userIdentifier, password, userToken: String?
    
    init(userIdentifier: String, password: String?) {
        super.init()
        self.userIdentifier = userIdentifier
        self.password = password
    }
    
    static var inverseMapping: RKObjectMapping = {
        let mapping = RKObjectMapping(forClass: Login.self)
        mapping.addAttributeMappingsFromDictionary([
            "B" : "userIdentifier",
            "A" : "password"
            ])
        
        return mapping.inverseMapping()
    }()
    
    static var mapping: RKObjectMapping = {
        let mapping = RKObjectMapping(forClass: Login.self)
        mapping.addAttributeMappingsFromDictionary([
            "A" : "userToken"
            ])
        
        return mapping
    }()

    
    //MARK: - Keychain
    class func getApiToken() -> String? {
        if let token = FXKeychain.defaultKeychain().objectForKey(apiTokenKey) {
            return token as? String
        }
        return nil
    }
    
    func saveApiToken() {
        FXKeychain.defaultKeychain().setObject(userToken, forKey: apiTokenKey)
    }
    
    class func deleteApiToken() {
        FXKeychain.defaultKeychain().removeObjectForKey(apiTokenKey)
    }
    
    class func isLoggedIn() -> Bool {
        if let _ = FXKeychain.defaultKeychain().objectForKey(apiTokenKey) {
            return true
        }
        return false
    }
}
