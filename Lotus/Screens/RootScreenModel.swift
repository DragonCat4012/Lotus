//
//  RootScreenModel.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//

import SwiftUI


class RootScreenModel: ObservableObject {
    // MARK: RootView
    @Published var isStatsScreenPresented = false
    @Published var isAddEntryScreenPresented = false
    @Published var isSettingsScreenPresented = false
    
    // MARK: ADddEntryScreen
    @Published var selectedType: Type = CoreData.getTypes().first!
    
    // MARK: EditType
    @Published var editTypePresented = false
    @Published var selectedTypeToEdit: Type?
    @Published var editSelectedColor: Color = .primary
    @Published var editTypeNme = ""
    
    func selectTypeToEdit(_ type: Type) {
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
    
    func addType(){
        CoreData.addType()
        allTypes = CoreData.getTypes()
    }
    
    func removeType(type: Type){
        CoreData.removeType(type: type)
        allTypes = CoreData.getTypes()
    }
    
    // MARK: YearSelector
    func forwardYear() {
        selectedYear += 1
    }
    
    func backwardYear() {
        selectedYear -= 1
    }
    
    func isLatestsYear() -> Bool {
        return CoreData.getLatestYear().year == selectedYear
    }
    
    // MARK: CalendarView
    @Published var selectedYear: Int64 = CoreData.getLatestYear().year
    
    func getColorForDay(_ day: Int, _ month: Int) -> Color {
        let year = CoreData.getYears().filter { $0.year == selectedYear}.first
        var items: [Entry] = []
        
        if year != nil {
            items = CoreData.getItemsOfAYear(year: year!)
        }
        
        var components = DateComponents()
        components.year = Int(selectedYear)
        components.month = month
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
    
    func getDaysInMonth(month: Int, year: Int) -> Int {
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
        let endDate = calendar.date(from:endComps)!
        
        
        let diff = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        
        return (diff.day ?? 0) + 1
    }
}
