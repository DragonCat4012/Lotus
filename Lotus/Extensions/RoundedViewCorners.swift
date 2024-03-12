//
//  RoundedViewCorners.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(corners: .allRounded, radius: radius) )
    }
}

enum Corners {
    case leftRounded
    case rightRounded
    case allRounded
    
    func corners() -> UIRectCorner {
        switch self {
        case .leftRounded:
            return [UIRectCorner.bottomLeft, .topLeft]
        case .rightRounded:
            return [UIRectCorner.bottomRight, .topRight]
        case .allRounded:
            return [UIRectCorner.allCorners]
        }
    }
}

struct RoundedCorner: Shape {
    var corners: Corners = .allRounded
    var radius: CGFloat = .infinity
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners.corners(), cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
