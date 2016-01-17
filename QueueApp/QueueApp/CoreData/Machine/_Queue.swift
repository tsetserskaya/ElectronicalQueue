// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Queue.swift instead.

import CoreData

public enum QueueAttributes: String {
    case date = "date"
}

public enum QueueRelationships: String {
    case intervals = "intervals"
    case resource = "resource"
}

@objc public
class _Queue: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Queue"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Queue.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var date: NSDate?

    // func validateDate(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var intervals: NSSet

    @NSManaged public
    var resource: Resource?

    // func validateResource(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

}

extension _Queue {

    func addIntervals(objects: NSSet) {
        let mutable = self.intervals.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.intervals = mutable.copy() as! NSSet
    }

    func removeIntervals(objects: NSSet) {
        let mutable = self.intervals.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.intervals = mutable.copy() as! NSSet
    }

    func addIntervalsObject(value: Interval!) {
        let mutable = self.intervals.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.intervals = mutable.copy() as! NSSet
    }

    func removeIntervalsObject(value: Interval!) {
        let mutable = self.intervals.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.intervals = mutable.copy() as! NSSet
    }

}

