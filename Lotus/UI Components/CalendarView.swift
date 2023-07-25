//
//  CalendarView.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI


struct CalendarView: View {
    @EnvironmentObject var vm: RootScreenModel
    
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
            ForEach(1..<vm.getDaysInMonth(month: month, year: Int(vm.selectedYear))) { i in
                RoundedRectangle(cornerRadius: 2)
                    .fill(vm.getColorForDay(i, month))
                    .frame(width: 5, height: 5)
            }
        }.padding(.horizontal, 5)
    }
}
