//
//  Category+CoreDataProperties.swift
//  Lotus
//
//  Created by Kiara on 12.03.24.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var color: String
    @NSManaged public var name: String
    @NSManaged public var rawValue: Int64

}

extension Category : Identifiable {

}
