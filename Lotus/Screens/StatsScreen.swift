//
//  StatsScreen.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI

struct StatsScreen: View {
    
    @EnvironmentObject var vm: RootScreenModel
    
    var body: some View {
        
        ZStack {
            Rectangle()
            Image("backImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .blur(radius: 2)
                .opacity(0.6)
            
            VStack {
                Text("Some Stats \(vm.selectedYear)")
                    .font(.title)
                Text("h")
            }.foregroundColor(.white)
           
        }.ignoresSafeArea()
    }
}


struct StatsScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatsScreen()
    }
}
