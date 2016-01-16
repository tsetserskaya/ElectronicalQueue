//
//  RestKitHelper.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 16/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit
import RestKit
import FXKeychain

let baseURL = "http://base.url"
let register = "api/authenticate"
let loginURL = "api/enduser/Register"
let userURL = "api/enduser"

class RestKitHelper: NSObject {

    static let sharedInstance = RestKitHelper()
    lazy var managedObjectContext = RKManagedObjectStore.defaultStore().mainQueueManagedObjectContext
    
    override init() {
        //        RKlcl_configure_by_name("RestKit/Network", RKlcl_vTrace.rawValue)
        
        let pathToPersistentStore = "\(RKApplicationDataDirectory())/queue.sqlite"
        let managedObjectStore = RKManagedObjectStore(managedObjectModel: NSManagedObjectModel.mergedModelFromBundles(nil))
        managedObjectStore.createPersistentStoreCoordinator()
        do {
            _ = try managedObjectStore.addSQLitePersistentStoreAtPath(pathToPersistentStore, fromSeedDatabaseAtPath: nil,  withConfiguration:nil,  options:nil);
        } catch {
            print(error)
        }
        
        managedObjectStore.createManagedObjectContexts()
        managedObjectStore.managedObjectCache = RKInMemoryManagedObjectCache(managedObjectContext: managedObjectStore.persistentStoreManagedObjectContext)
        
        // Initialize RestKit for server cooperation:
        let manager = RKObjectManager(baseURL: NSURL(string: baseURL))
        manager.requestSerializationMIMEType = RKMIMETypeJSON
        manager.managedObjectStore = managedObjectStore
        
        
        //Mapping for Login
        manager.addRequestDescriptor(RKRequestDescriptor(mapping: Login.inverseMapping, objectClass: Login.self, rootKeyPath: nil, method: .POST))
        manager.addResponseDescriptor(RKResponseDescriptor(mapping: Login.mapping, method: .POST, pathPattern: loginURL, keyPath: nil, statusCodes: RKStatusCodeIndexSetForClass(.Successful)))
        
        ////Mapping for User
        
        RKObjectManager.setSharedManager(manager)
    }

    func setApiToken() -> Bool {
        if let token = Login.getApiToken() {
            RKObjectManager.sharedManager().HTTPClient.setDefaultHeader("API-Token", value: token)
            return true
        }
        return false
    }
    
    class func saveContext() {
        do {
            try RKManagedObjectStore.defaultStore().mainQueueManagedObjectContext.saveToPersistentStore()
        } catch {
            print("Saving context error: \(error)")
        }
    }
    
    
}
