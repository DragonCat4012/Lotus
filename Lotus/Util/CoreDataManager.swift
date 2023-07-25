//
//  CoreDataManager.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//

import Foundation

struct CoreData {
    static let context = CoreDataStack.sharedContext
    
    static func getTypes() -> [Type] {
        var arr: [Type] = []
        do {
            arr = try context.fetch(Type.fetchRequest())
            
            if arr.isEmpty {
                // TODO: generate default types & append to arr
                try! context.save()
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
    
    static func getItemsOfAYear(year: Year) -> [Entry] {
        return (year.items.allObjects as? [Entry])!
    }
    
    static func addItem(year: Year = getLatestYear(), date: Date, type: Int64) {
        let newItem = Entry(context: context)
        newItem.timestamp = date.cleanDate()
        newItem.value = type
        year.addToItems(newItem)
        try! context.save()
    }
    
    static func removeItem(item: Entry) {
        do {
            context.delete(item)
            try context.save()
        } catch {
            log("Error deleting Item")
        }
    }
    
    static func editType(type: Type, color: String) {
        do {
            type.color = color
            try context.save()
        } catch {
            log("Error editing Type")
        }
    }
    
    static func addType(color: String) {
        var num: Int64 = 0
        let assignedInts = getTypes().map { $0.rawValue}
        let newItem = Type(context: context)
        newItem.color = color
        
        repeat {
            num += 1
        } while (assignedInts.contains(num))
        
        newItem.rawValue = num
        
        do {
            try context.save()
        } catch {
            log("Error adding Type")
        }
        
        //TODO: check for unassigned int
    }
    
    static func removeType(type: Type) {
        //TODO: remove all items with this type
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
