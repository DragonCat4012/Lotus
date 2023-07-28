//
//  BarView.swift
//  Lotus
//
//  Created by Kiara on 28.07.23.
//

import SwiftUI

struct BarView: View {
    
    var body: some View {
        barChart().padding(.horizontal).frame(height: 20)
    }
    
    func barChart() -> some View {
        GeometryReader { geo in
            let width = geo.size.width
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8).fill(Color.gray).frame(width: width).frame(height: 20)
                RoundedRectangle(cornerRadius: 8).fill(Color.primary).frame(width: width * 0.4).frame(height: 20)
                RoundedRectangle(cornerRadius: 8).fill(Color.secondary).frame(width: width * 0.2).frame(height: 20)
            }
        }
        
    }
}
