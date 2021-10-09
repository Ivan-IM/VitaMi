//
//  CustomMinButtonStyle.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.10.2021.
//

import SwiftUI

struct CustomMinButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .foregroundColor(isEnabled ? Color("text"):.gray)
            .background(
                Group {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .shadow(color: .white.opacity(0.5), radius: configuration.isPressed ? 3: 8, x: configuration.isPressed ? -5: -8, y: configuration.isPressed ? -5: -8)
                            .shadow(color: .black.opacity(0.5), radius: configuration.isPressed ? 3: 8, x: configuration.isPressed ? 5: 8, y: configuration.isPressed ? 5: 8)
                            .blendMode(.overlay)
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color("background"))
                    }
                }
            )
    }
}
