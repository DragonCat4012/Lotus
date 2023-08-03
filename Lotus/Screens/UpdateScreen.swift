//
//  UpdateScreen.swift
//  Lotus
//
//  Created by Kiara on 03.08.23.
//

import SwiftUI

let newFeatures: [String] = [""]

struct UpdateScreen: View {
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
                Text("Whats new?")
                    .font(.title)
                
                ForEach(newFeatures, id: \.self) { entry in
                    Text("- " + entry)
                }
            }.foregroundColor(.white)
            
        }.ignoresSafeArea()
    }
}
