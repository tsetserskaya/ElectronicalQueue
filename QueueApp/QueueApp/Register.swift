//
//  Register.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 16/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit
import RestKit

class Register: NSObject {
    
    var login, password: String?
    
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
    
    
}
