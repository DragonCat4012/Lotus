//
//  FirstLaunchScreen.swift
//  Lotus
//
//  Created by Kiara on 03.08.23.
//

import SwiftUI

struct FirstLaunchScreen: View {
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
                Text("Welcome")
                    .font(.title)
                Text("some cool test ;3")
            }.foregroundColor(.white)
            
        }.ignoresSafeArea()
    }
}

struct FirstLaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstLaunchScreen()
    }
}
