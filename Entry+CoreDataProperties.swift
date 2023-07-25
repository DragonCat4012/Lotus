//
//  Entry+CoreDataProperties.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var timestamp: Date
    @NSManaged public var value: Int64
    @NSManaged public var year: Year?

}

extension Entry : Identifiable {

}
