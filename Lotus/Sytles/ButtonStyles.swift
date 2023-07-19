//
//  ButtonStyles.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI

struct PrimaryStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 15)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.primary)
            .cornerRadius(8)
            .foregroundColor(.white)
    }
}

struct SecondaryStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 15)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.secondary)
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
