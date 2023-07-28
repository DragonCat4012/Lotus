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
                RoundedRectangle(cornerRadius: 8).fill(Color.orange).frame(width: 50, height: 50)
                RoundedRectangle(cornerRadius: 8).fill(Color.orange).frame(width: 50, height: 50)
                RoundedRectangle(cornerRadius: 8).fill(Color.orange).frame(width: 50, height: 50)
            }
            
            HStack {
                Text("#1").frame(width: 50)
                Text("#2").frame(width: 50)
                Text("#3").frame(width: 50)
            }
        }
    }
}
