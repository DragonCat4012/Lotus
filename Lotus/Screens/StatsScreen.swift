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
                Text("Some Stats \(String(vm.selectedYear))")
                    .font(.title)
                
                barChart().padding(.vertical).background(Color.blue).frame(height: 20)
                
                topTypes()
                
            }.foregroundColor(.white)
           
        }.ignoresSafeArea()
    }
    
    func topTypes() -> some View {
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
