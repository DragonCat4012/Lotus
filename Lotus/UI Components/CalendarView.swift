//
//  CalendarView.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI


struct CalendarView: View {
    @State var year: Year = CoreData.getLatestYear()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.black.opacity(0.4))
                .frame(height: 150)
                .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black.opacity(0.6), lineWidth: 1)
                        )
                .overlay {
                    VStack(alignment: .leading) {
                        ForEach(0..<11) { i in
                            month(i)
                        }
                    }
                }
        }.frame(height: 150)
    }
    
    func month(_ month: Int) -> some View {
        HStack(spacing: 2) {
            ForEach(0..<getDaysInMonth(month: month, year: Int(year.year))) { i in
                RoundedRectangle(cornerRadius: 2)
                    .fill(getColorForDay(i, month))
                    .frame(width: 5, height: 5)
            }
        }.padding(.horizontal, 5)
    }
    
    func getColorForDay(_ day: Int, _ month: Int) -> Color {
        let items = CoreData.getItemsOfAYear(year: year)
        
        var components = DateComponents()
        components.year = Int(year.year)
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

        return diff.day ?? 1
    }
