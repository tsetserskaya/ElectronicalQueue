
import Foundation
import CoreData

@objc(User)
public class User: _User {

    class func createUser(name:String) {
        let user = User(managedObjectContext: RestKitHelper.sharedInstance.managedObjectContext)
        user.name = name
        RestKitHelper.saveContext()
    }
    
    class func getUserWithName(name: String) -> User? {
        let request = NSFetchRequest(entityName: User.entityName())
        let predicate = NSPredicate(format: "name == %@", name)
        request.predicate = predicate
        var users = [User]()
        do {
            users = try RestKitHelper.sharedInstance.managedObjectContext.executeFetchRequest(request) as! [User]
        }
        catch {
            
        }
        
        return users.first
       
    }

}
