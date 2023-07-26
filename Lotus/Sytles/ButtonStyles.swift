//
//  ButtonStyles.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI

struct PrimaryStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 15)
            .frame(maxWidth: .infinity)
            .padding()
            .background(isEnabled ? Color.primary : Color.gray)
            .cornerRadius(8)
            .foregroundColor(.white)
    }
}

struct SecondaryStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 15)
            .frame(maxWidth: .infinity)
            .padding()
            .background(isEnabled ? Color.secondary : Color.gray)
            .cornerRadius(8)
            .foregroundColor(.white)
    }
}

struct DestructiveStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 15)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red.opacity(0.5))
            .cornerRadius(8)
            .foregroundColor(.red)
    }
}
