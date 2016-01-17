// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to City.swift instead.

import CoreData

public enum CityAttributes: String {
    case name = "name"
}

public enum CityRelationships: String {
    case country = "country"
    case organisations = "organisations"
}

@objc public
class _City: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "City"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _City.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var name: String?

    // func validateName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var country: Country?

    // func validateCountry(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var organisations: NSSet

}

extension _City {

    func addOrganisations(objects: NSSet) {
        let mutable = self.organisations.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.organisations = mutable.copy() as! NSSet
    }

    func removeOrganisations(objects: NSSet) {
        let mutable = self.organisations.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.organisations = mutable.copy() as! NSSet
    }

    func addOrganisationsObject(value: Organisation!) {
        let mutable = self.organisations.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.organisations = mutable.copy() as! NSSet
    }

    func removeOrganisationsObject(value: Organisation!) {
        let mutable = self.organisations.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.organisations = mutable.copy() as! NSSet
    }

}

