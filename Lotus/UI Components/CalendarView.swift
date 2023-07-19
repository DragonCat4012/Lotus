//
//  CalendarView.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI


struct CalendarView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.black.opacity(0.5))
                .frame(height: 150)
            
                .overlay {
                    VStack(spacing: 1) {
                        ForEach(0..<11) { i in
                            month()
                        }
                    }
                }
            
          
     
        }.frame(height: 150)
    }
    
    func month() -> some View {
        HStack {
            ForEach(0..<30) { i in
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 5, height: 5)
                        }
            Spacer()
            Text("ABC")
        }.padding(.horizontal)
            .frame(height: 150/12 - 20)
    }
}
