//
//  CustomCircleButtonStyle.swift
//  VitaMi
//
//  Created by Иван Маришин on 14.08.2021.
//

import SwiftUI

struct CustomCircleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .padding(30)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1.0)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                    else {
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1.0)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
                            .shadow(color: .white.opacity(0.8), radius: 5, x: -5, y: -5)
                    }
                }
            )
    }
}
