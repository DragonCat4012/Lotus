//
//  CalendarView2.swift
//  Lotus
//
//  Created by Kiara on 12.03.24.
//

import SwiftUI

struct CalendarView2: View {
    var vm: CalendarDelegate
    
    var body: some View {
       ZStack {
             Image("backImageSmall")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.top)
           
           calendar()
               .padding()
       }
    }
    
    func calendar() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.black.opacity(0.4))
                .frame(height: 160)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.6), lineWidth: 1)
                )
                .overlay {
                    tiles()
                }
        }.frame(height: 150)
    }
    
    func tiles() -> some View {
        return VStack(alignment: .leading) {
            ForEach(0..<12, id: \.self) { index in
                let days = vm.getDaysForMonth(index)
                HStack(spacing: 5) {
                    ForEach(1..<days, id: \.self) { i in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(vm.getcolorForDay(i, index))
                            .frame(width: 5, height: 5)
                    }
                }.padding(.horizontal, 5)
            }
        }
    }
}

protocol CalendarDelegate {
    func getDaysForCalendar() -> [Int]
    func getDaysForMonth(_ month: Int) -> Int
    func getcolorForDay(_ i: Int, _ index: Int) -> Color
}

class WidgetCalendarViewModel: CalendarDelegate {
    var selectedYear = Int(CoreData.getLatestYear().year)
    
    func getDaysForCalendar() -> [Int] {
        var arr: [Int] = []
        for month in 1..<13 {
            arr.append(getDaysForMonth(month))
        }
        return arr
    }
    
    func getDaysForMonth(_ month: Int) -> Int {
        let calendar = Calendar.current
        
        var startComps = DateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = selectedYear
        
        var endComps = DateComponents()
        endComps.day = 1
        endComps.month = month == 12 ? 1 : month + 1
        endComps.year = month == 12 ? selectedYear + 1 : selectedYear
        
        let startDate = calendar.date(from: startComps)!
        let endDate = calendar.date(from: endComps)!
        
        let diff = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        
        return (diff.day ?? 0) + 1
    }
    
    func getcolorForDay(_ day: Int, _ month: Int) -> Color {
        let year = CoreData.getYears().filter { $0.year == selectedYear}.first
        var items: [MoodEntry] = []
        
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
}
