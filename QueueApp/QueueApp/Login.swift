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

let apiTokenKey = "com.queue.apiToken"

class Login: NSObject {

    var login, password, apiToken: String?
    
    init(login: String, password: String?) {
        super.init()
        self.login = login
        self.password = password
    }
    
    static var inverseMapping: RKObjectMapping = {
        let mapping = RKObjectMapping(forClass: Login.self)
        mapping.addAttributeMappingsFromDictionary([
            "B" : "login",
            "A" : "password"
            ])
        
        return mapping.inverseMapping()
    }()
    
    static var mapping: RKObjectMapping = {
        let mapping = RKObjectMapping(forClass: Login.self)
        mapping.addAttributeMappingsFromDictionary([
            "A" : "apiToken"
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
        FXKeychain.defaultKeychain().setObject(apiToken, forKey: apiTokenKey)
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
