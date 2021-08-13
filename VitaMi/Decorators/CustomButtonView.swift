//
//  CustomButtonView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct CustomButtonView: View {
    
    let buttonTitle: String
    var action: () -> Void
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Button(action: action, label: {
            Text(buttonTitle)
                .frame(width: width, height: height)
        })
        .buttonStyle(CustomButtonStyle())
    }
}
