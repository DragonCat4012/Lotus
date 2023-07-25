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
    
    
    // MARK: CalendarView
    @Published var selectedYear: Year = CoreData.getLatestYear()
    
    func getColorForDay(_ day: Int, _ month: Int) -> Color {
        let items = CoreData.getItemsOfAYear(year: selectedYear)
        
        var components = DateComponents()
        components.year = Int(selectedYear.year)
        components.month = month
        components.day = day
        let targetDate = Calendar.current.date(from: components)!.cleanDate()
        
        let item = items.filter{ $0.timestamp.cleanDate() == targetDate}
        if item.first != nil {
            return Color.secondary
        } else {
            return Color.white.opacity(0.2)
        }
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
