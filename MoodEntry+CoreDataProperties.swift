//
//  Entry+CoreDataProperties.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//
//

import Foundation
import CoreData


extension MoodEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoodEntry> {
        return NSFetchRequest<MoodEntry>(entityName: "MoodEntry")
    }

    @NSManaged public var timestamp: Date
    @NSManaged public var value: Int64
    @NSManaged public var year: Year?

}

extension MoodEntry : Identifiable {

}
