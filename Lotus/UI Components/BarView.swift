//
//  BarView.swift
//  Lotus
//
//  Created by Kiara on 28.07.23.
//

import SwiftUI

struct BarView: View {
    
    @EnvironmentObject var vm: RootScreenModel
    
    var body: some View {
        barChart().padding(.horizontal).frame(height: 20)
    }
    
    func barChart() -> some View {
        let maxCount: Double = Double(vm.highestRanks.map { $0.count}.reduce(0, +))
        
        return GeometryReader { geo in
            let width = geo.size.width
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8).fill(Color.gray).frame(width: width).frame(height: 20)
                
                HStack(spacing: 0) {
                    if maxCount > 0 {
                        ForEach(vm.highestRanks, id: \.self) { res in
                            let percent: Double = Double(res.count) / maxCount
                            let color = Color(hexString: res.type.color)
                            RoundedRectangle(cornerRadius: 8).fill(color).frame(width: width * percent).frame(height: 20)
                        }
                    }
                }
            }
        }
        
    }
}
