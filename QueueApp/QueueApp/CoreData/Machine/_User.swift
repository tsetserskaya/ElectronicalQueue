// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.swift instead.

import CoreData

public enum UserAttributes: String {
    case adress = "adress"
    case age = "age"
    case city = "city"
    case country = "country"
    case lastName = "lastName"
    case name = "name"
    case phone = "phone"
}

public enum UserRelationships: String {
    case intervals = "intervals"
}

@objc public
class _User: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "User"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _User.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var adress: String?

    // func validateAdress(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var age: String?

    // func validateAge(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var city: String?

    // func validateCity(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var country: String?

    // func validateCountry(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var lastName: String?

    // func validateLastName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var name: String?

    // func validateName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var phone: String?

    // func validatePhone(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var intervals: NSSet

}

extension _User {

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

