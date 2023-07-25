//
//  Item+CoreDataProperties.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date
    @NSManaged public var value: Int64
    @NSManaged public var year: Year

}

extension Item : Identifiable {

}
