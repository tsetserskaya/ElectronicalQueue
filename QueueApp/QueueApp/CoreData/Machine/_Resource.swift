// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Resource.swift instead.

import CoreData

public enum ResourceAttributes: String {
    case name = "name"
}

public enum ResourceRelationships: String {
    case organisation = "organisation"
    case queues = "queues"
}

@objc public
class _Resource: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Resource"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Resource.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var name: String?

    // func validateName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var organisation: Organisation?

    // func validateOrganisation(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var queues: NSSet

}

extension _Resource {

    func addQueues(objects: NSSet) {
        let mutable = self.queues.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.queues = mutable.copy() as! NSSet
    }

    func removeQueues(objects: NSSet) {
        let mutable = self.queues.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.queues = mutable.copy() as! NSSet
    }

    func addQueuesObject(value: Queue!) {
        let mutable = self.queues.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.queues = mutable.copy() as! NSSet
    }

    func removeQueuesObject(value: Queue!) {
        let mutable = self.queues.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.queues = mutable.copy() as! NSSet
    }

}

