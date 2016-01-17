//
//  RequestManager.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 16/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit
import RestKit

public enum Result {
    case Success(RKMappingResult)
    case Error(NSError)
}

public typealias Completion = Result -> Void

class RequestManager: NSObject {

    class func loginRequest(loginInfo: Login, completion: Completion?) {
        RKObjectManager.sharedManager().postObject(loginInfo, path: loginURL, parameters: nil,
            success: {
                completion?(.Success($1))
            },
            failure: {
                completion?(.Error($1))
        })
    }
    
    class func registerRequest(loginInfo: Login, completion: Completion?) {
        RKObjectManager.sharedManager().postObject(loginInfo, path: registerURL, parameters: nil,
            success: {
                completion?(.Success($1))
            },
            failure: {
                completion?(.Error($1))
        })
    }
    
}
