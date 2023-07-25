//
//  YearSelector.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//

import SwiftUI


struct YearSelector: View {
    @EnvironmentObject var vm: RootScreenModel
    
    var body: some View {
        HStack (spacing: 8) {
            Button {
                vm.backwardYear()
            } label: {
                Image(systemName: "chevron.left.2")
            }.cornerRadius(15, corners: [.bottomLeft, .topLeft])
                .frame(width: 40)
            
            Button {
                
            } label: {
                Text(String(vm.selectedYear))
            }
            .frame(width: 80)
            
            Button {
                vm.forwardYear()
            } label: {
                Image(systemName: "chevron.right.2")
            }.cornerRadius(15, corners: [.topRight, .bottomRight])
                .frame(width: 40)
            
        }.buttonStyle(PrimaryStyle())
        
    }
}

struct YearSelector_Previews: PreviewProvider {
    static var previews: some View {
        YearSelector()
            .environmentObject(RootScreenModel())
    }
}
