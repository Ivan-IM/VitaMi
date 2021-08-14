//
//  CustomCircleButtonView.swift
//  VitaMi
//
//  Created by Иван Маришин on 14.08.2021.
//

import SwiftUI

struct CustomCircleButtonView: View {
    
    let buttonTitle: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(buttonTitle)
        })
        .buttonStyle(CustomCircleButtonStyle())
    }
}
