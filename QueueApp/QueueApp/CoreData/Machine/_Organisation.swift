// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Organisation.swift instead.

import CoreData

public enum OrganisationAttributes: String {
    case attribute = "attribute"
    case doctor = "doctor"
    case name = "name"
}

public enum OrganisationRelationships: String {
    case city = "city"
    case resources = "resources"
}

@objc public
class _Organisation: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Organisation"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Organisation.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var doctor: String?

    // func validateDoctor(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var name: String?

    // func validateName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var city: City?

    // func validateCity(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var resources: NSSet

}

extension _Organisation {

    func addResources(objects: NSSet) {
        let mutable = self.resources.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.resources = mutable.copy() as! NSSet
    }

    func removeResources(objects: NSSet) {
        let mutable = self.resources.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.resources = mutable.copy() as! NSSet
    }

    func addResourcesObject(value: Resource!) {
        let mutable = self.resources.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.resources = mutable.copy() as! NSSet
    }

    func removeResourcesObject(value: Resource!) {
        let mutable = self.resources.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.resources = mutable.copy() as! NSSet
    }

}

