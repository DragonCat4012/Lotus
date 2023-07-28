//
//  RankingView.swift
//  Lotus
//
//  Created by Kiara on 28.07.23.
//

import SwiftUI

struct RankingView: View {
    
    @EnvironmentObject var vm: RootScreenModel
    
    var body: some View {
        VStack {
            HStack {
                entryView(0)
                entryView(1)
                entryView(2)
            }
            
            HStack {
                Text("#1").frame(width: 50)
                Text("#2").frame(width: 50)
                Text("#3").frame(width: 50)
            }
        }
    }
    
    func entryView(_ nr: Int) -> some View {
        let entry = vm.getRank(nr)
        return ZStack {
            RoundedRectangle(cornerRadius: 8).fill(entry.0)
            Text(String(entry.1))
        }.frame(width: 50, height: 50)
    }
}

struct SortResult {
    let type: Type
    let count: Int
}
