//
//  CoreDataManager.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//

import Foundation
import SwiftUI
import UIKit

struct CoreData {
    static let context = CoreDataStack.sharedContext
    
    static func getTypes() -> [Category] {
        var arr: [Category] = []
        do {
            arr = try context.fetch(Category.fetchRequest())
            
            if arr.isEmpty {
                let newType = Category(context: context)
                newType.rawValue = 0
                newType.color = "fffddd"
                try! context.save()
                arr.append(newType)
                return arr
            }
            return arr
        } catch {
            log("Error getting Types")
        }
        return arr
    }
    
    static func getYears() -> [Year] {
        var arr: [Year] = []
        do {
            arr = try context.fetch(Year.fetchRequest())
            
            if arr.isEmpty {
                let newYear = Year(context: context)
                newYear.year = Int64(Calendar.current.component(.year, from: Date()))
                try! context.save()
                arr.append(newYear)
                return arr
            }
            return arr
        } catch {
            log("Error getting years")
        }
        return arr
    }
    
    static func getEntrys() -> [MoodEntry] {
        var arr: [MoodEntry] = []
        do {
            arr = try context.fetch(MoodEntry.fetchRequest())
        } catch {
            log("Error getting entrys")
        }
        return arr
    }
    
    static func getItemsOfAYear(year: Year) -> [MoodEntry] {
        return (year.items.allObjects as? [MoodEntry])!
    }
    
    static func addItem(year: Year = getLatestYear(), date: Date, type: Int64) {
        let newItem = MoodEntry(context: context)
        newItem.timestamp = date.cleanDate()
        newItem.value = type
        year.addToItems(newItem)
        try! context.save()
    }
    
    static func removeItem(item: MoodEntry) {
        do {
            context.delete(item)
            try context.save()
        } catch {
            log("Error deleting Item")
        }
    }
    
    static func editType(type: Category, color: Color, name: String) {
        do {
            type.color = UIColor(color).toHexString()
            type.name = name
            
            try context.save()
        } catch {
            log("Error editing Type")
        }
    }
    
    static func addType(color: String = UIColor(Color.primary).toHexString(), name: String = "name") {
        var num: Int64 = 0
        let assignedInts = getTypes().map { $0.rawValue}
        let newItem = Category(context: context)
        newItem.color = color
        
        repeat {
            num += 1
        } while (assignedInts.contains(num))
        
        newItem.rawValue = num
        newItem.name = name
        
        do {
            try context.save()
        } catch {
            log("Error adding Type")
        }
        
        // TODO: check for unassigned int
    }
    
    static func removeType(type: Category) {
        let count = getTypes().count
        
        if count == 1 {
            log("Cant delete last type")
            return
        }
        
        getEntrys().forEach { entry in
            if entry.value == type.rawValue {
                context.delete(entry)
            }
        }
        
        context.delete(type)
        do {
            try context.save()
        } catch {
            log("Error removing Type")
        }
    }
    
    static func getLatestYear() -> Year {
        let years = getYears()
        if years.isEmpty {
            assertionFailure("No current year")
        }
        return years.sorted(by: { $0.year > $1.year}).first!
    }
    
    // MARK: util funcs
    static func log(_ content: String) {
        print("[CoreData] ", content)
    }
}
