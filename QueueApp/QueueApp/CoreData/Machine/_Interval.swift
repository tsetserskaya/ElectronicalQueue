// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Interval.swift instead.

import CoreData

public enum IntervalAttributes: String {
    case time = "time"
}

public enum IntervalRelationships: String {
    case queue = "queue"
    case user = "user"
}

@objc public
class _Interval: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Interval"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Interval.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var time: NSDate?

    // func validateTime(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var queue: Queue?

    // func validateQueue(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var user: User?

    // func validateUser(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

}

