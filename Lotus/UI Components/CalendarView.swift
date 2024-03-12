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
                .frame(height: 160)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.6), lineWidth: 1)
                )
                .overlay {
                    tiles()
                }
        }.frame(height: 150)
            .onAppear(perform: vm.getTileData)
    }
    
    func tiles() -> some View {
        return VStack(alignment: .leading) {
            ForEach(0..<vm.daysForMonth.count, id: \.self) { index in
                let days = vm.daysForMonth[index]
                HStack(spacing: 5) {
                    ForEach(1..<days, id: \.self) { i in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(vm.getColorForDay(i, index))
                            .frame(width: 5, height: 5)
                    }
                }.padding(.horizontal, 5)
            }
        }
    }
}

