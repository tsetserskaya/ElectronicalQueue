// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Country.swift instead.

import CoreData

public enum CountryAttributes: String {
    case name = "name"
}

public enum CountryRelationships: String {
    case coutnries = "coutnries"
}

@objc public
class _Country: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Country"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Country.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var name: String?

    // func validateName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var coutnries: NSSet

}

extension _Country {

    func addCoutnries(objects: NSSet) {
        let mutable = self.coutnries.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.coutnries = mutable.copy() as! NSSet
    }

    func removeCoutnries(objects: NSSet) {
        let mutable = self.coutnries.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.coutnries = mutable.copy() as! NSSet
    }

    func addCoutnriesObject(value: City!) {
        let mutable = self.coutnries.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.coutnries = mutable.copy() as! NSSet
    }

    func removeCoutnriesObject(value: City!) {
        let mutable = self.coutnries.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.coutnries = mutable.copy() as! NSSet
    }

}

