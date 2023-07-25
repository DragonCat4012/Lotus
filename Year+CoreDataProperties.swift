//
//  Year+CoreDataProperties.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//
//

import Foundation
import CoreData


extension Year {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Year> {
        return NSFetchRequest<Year>(entityName: "Year")
    }

    @NSManaged public var year: Int64
    @NSManaged public var items: NSSet

}

// MARK: Generated accessors for items
extension Year {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Entry)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Entry)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Year : Identifiable {

}
