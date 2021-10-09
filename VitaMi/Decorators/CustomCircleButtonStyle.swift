//
//  CustomCircleButtonStyle.swift
//  VitaMi
//
//  Created by Иван Маришин on 14.08.2021.
//

import SwiftUI

struct CustomCircleButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .foregroundColor(isEnabled ? Color("text"):.gray)
            .padding(30)
            .background(
                Group {
                    ZStack {
                        Circle()
                            .shadow(color: .white.opacity(0.9), radius: configuration.isPressed ? 3: 8, x: configuration.isPressed ? -1: -5, y: configuration.isPressed ? -1: -5)
                            .shadow(color: .black.opacity(1), radius: configuration.isPressed ? 3: 8, x: configuration.isPressed ? 1: 5, y: configuration.isPressed ? 1: 5)
                            .blendMode(.overlay)
                        Circle()
                            .fill(Color("background"))
                    }
                }
            )
            .animation(.spring())
    }
}
