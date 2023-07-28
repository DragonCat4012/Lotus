//
//  StatsScreen.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI

struct StatsScreen: View {
    
    
    var body: some View {
                barChart().padding(.vertical).background(Color.blue).frame(height: 20)
              
    }
    
    func barChart() -> some View {
        GeometryReader { geo in
            let width = geo.size.width * 0.8
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8).fill(Color.red).frame(width: width).frame(height: 20)
                RoundedRectangle(cornerRadius: 8).fill(Color.orange).frame(width: width * 0.4).frame(height: 20)
                RoundedRectangle(cornerRadius: 8).fill(Color.green).frame(width: width * 0.2).frame(height: 20)
            }
        }
        
    }
}


struct StatsScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatsScreen()
    }
}
