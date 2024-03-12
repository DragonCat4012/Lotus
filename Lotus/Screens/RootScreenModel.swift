//
//  RootScreenModel.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//

import SwiftUI

class RootScreenModel: ObservableObject {
    // MARK: RootView
    @Published var isAddEntryScreenPresented = false
    @Published var isSettingsScreenPresented = false
    @Published var isEditEntriesScreenPresented = false
    
    @Published var isFirstLaunchScreenPresented = false
    @Published var isUpdateScreenPresented = false
    
    func checkIfFirstLaunch() {
        if isFirstLaunch() {
            isFirstLaunchScreenPresented = true
        } else if !isLatestVersion() {
            isUpdateScreenPresented = true
            setLatestVersion()
        }
    }

    func onAppear() {
        getHighestRanks()
    }

    // MARK: ADddEntryScreen
    @Published var selectedType: Category = CoreData.getTypes().first!

    // MARK: EditType
    @Published var editTypePresented = false
    @Published var selectedTypeToEdit: Category?
    @Published var editSelectedColor: Color = .primary
    @Published var editTypeNme = ""

    func selectTypeToEdit(_ type: Category) {
        selectedTypeToEdit = type
        editSelectedColor = Color(hexString: type.color)
        editTypeNme = type.name
        withAnimation {
            editTypePresented = true
        }
    }

    func saveTypeChanges() {
        guard let type = selectedTypeToEdit else { return }
    
        CoreData.editType(type: type, color: editSelectedColor, name: editTypeNme)
    
        selectedTypeToEdit = nil
    
        withAnimation {
            editTypePresented = false
        }
    }

    // MARK: Settings
    @Published var allTypes = CoreData.getTypes()
    @Published var allEntries = CoreData.getEntrys()

    func addType() {
        CoreData.addType()
        allTypes = CoreData.getTypes()
    }

    func removeType(type: Category) {
        CoreData.removeType(type: type)
        allTypes = CoreData.getTypes()
    }

    func deleteEntry(_ entry: Entry) {
        CoreData.removeItem(item: entry)
        allEntries = CoreData.getEntrys()
    }

    // MARK: YearSelector
    func forwardYear() {
        selectedYear += 1
        getTileData()
        getHighestRanks()
        self.objectWillChange.send()
    }

    func backwardYear() {
        selectedYear -= 1
        getTileData()
        getHighestRanks()
        self.objectWillChange.send()
    }

    func isLatestsYear() -> Bool {
        return CoreData.getLatestYear().year == selectedYear
    }

    // MARK: CalendarView
    @Published var selectedYear: Int64 = CoreData.getLatestYear().year
    @Published var daysForMonth: [Int] = []

    func getTileData() {
        var arr: [Int] = []
        for month in 1..<13 {
            arr.append(getDaysInMonth(month: month))
        }
        daysForMonth = arr
    }
    
    func getTilesCountForType(type: Category) -> Int {
        return CoreData.getEntrys().filter { $0.value == type.rawValue}.count
    }
    
    func getColorForDay(_ day: Int, _ month: Int) -> Color {
        let year = CoreData.getYears().filter { $0.year == selectedYear}.first
        var items: [Entry] = []
        
        if year != nil {
            items = CoreData.getItemsOfAYear(year: year!)
        }
        
        var components = DateComponents()
        components.year = Int(selectedYear)
        components.month = month + 1
        components.day = day
        let targetDate = Calendar.current.date(from: components)!.cleanDate()
        
        guard let item =  items.filter({ $0.timestamp.cleanDate() == targetDate}).first else {
            return Color.white.opacity(0.2)
        }
        
        guard let type = CoreData.getTypes().filter({ $0.rawValue == item.value}).first else {
            return Color.white.opacity(0.2)
        }
        
        return Color(hexString: type.color)
    }
    
    func getColorForEntry(_ entry: Entry) -> Color {
        guard let type = CoreData.getTypes().filter({ $0.rawValue == entry.value}).first else {
            return Color.white.opacity(0.2)
        }
        return Color(hexString: type.color)
    }
    
    func getDaysInMonth(month: Int) -> Int {
        let year = Int(selectedYear)
        let calendar = Calendar.current
        
        var startComps = DateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        
        var endComps = DateComponents()
        endComps.day = 1
        endComps.month = month == 12 ? 1 : month + 1
        endComps.year = month == 12 ? year + 1 : year
        
        let startDate = calendar.date(from: startComps)!
        let endDate = calendar.date(from: endComps)!
        
        let diff = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        
        return (diff.day ?? 0) + 1
    }
    
    // MARK: Ranking View
    @Published var highestRanks: [SortResult] = []
    
    func getHighestRanks() {
        let types = CoreData.getTypes()
        let entrys = CoreData.getEntrys().filter { $0.year?.year == selectedYear}
        
        var arr: [SortResult] = []
        
        types.forEach { type in
            arr.append(SortResult(category: type, count: entrys.filter {$0.value == type.rawValue}.count))
        }
        
        highestRanks = arr.sorted { $0.count > $1.count }
    }
    
    func getRank(_ nr: Int) -> (Color, String) {
        if highestRanks.count > nr {
            let color = Color(hexString: highestRanks[nr].category.color)
            return (color, "\(highestRanks[nr].category.rawValue)")
        }
        return (Color.gray, "-")
    }
    
    func updateView() {
        getHighestRanks()
    }
}
