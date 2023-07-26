//
//  Type+CoreDataProperties.swift
//  Lotus
//
//  Created by Kiara on 26.07.23.
//
//

import Foundation
import CoreData


extension Type {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Type> {
        return NSFetchRequest<Type>(entityName: "Type")
    }

    @NSManaged public var color: String
    @NSManaged public var rawValue: Int64
    @NSManaged public var name: String

}

extension Type : Identifiable {

}
