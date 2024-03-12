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
                RoundedCorner(corners: .allRounded, radius: 8)
                    .fill(Color.gray)
                    .frame(width: width).frame(height: 20)
                
                HStack(spacing: 0) {
                    if maxCount > 0 {
                        ForEach(Array(vm.highestRanks.enumerated()), id: \.offset) { index, res in
                            let corners = getCorners(index, vm.highestRanks.count - 1)
                            let percent: Double = Double(res.count) / maxCount
                            let color = Color(hexString: res.category.color)
                            
                            if index == 1 && vm.highestRanks.count == 3 {
                                Rectangle()
                                    .fill(color)
                                    .frame(width: width * percent).frame(height: 20)
                            } else {
                                RoundedCorner(corners: corners, radius: 8)
                                    .fill(color)
                                    .frame(width: width * percent).frame(height: 20)
                            }
                            
                        }
                    }
                }
            }
        }
        
    }
    
    func getCorners(_ index: Int, _ maxIndex: Int) -> Corners {
        if maxIndex == 2 { // 3 entries
            if index == 0 {
                return .leftRounded
            } else if index == 1 { // not rounded at all??
                return .allRounded
            } else {
                return .rightRounded
            }
        } else if maxIndex == 1 { // 2 entries
            if index == 0 {
                return .leftRounded
            } else {
                return .rightRounded
            }
        } else { // 1 entry
            return .allRounded
        }
    }
}
