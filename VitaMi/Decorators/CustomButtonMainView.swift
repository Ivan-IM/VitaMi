//
//  CustomButtonMainView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.10.2021.
//

import SwiftUI

struct CustomButtonMainView: View {
    
    let buttonTitle: String
    let imageName: String
    let imageColor: Color
    var action: () -> Void
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                Image(systemName: imageName)
                    .offset(x: -width/4, y: -height/4)
                    .font(.system(size: width/4, weight: .regular))
                    .imageScale(.large)
                    .foregroundColor(imageColor)
                    .opacity(0.8)
                Text(buttonTitle)
                    .offset(y: height/4)
                    .multilineTextAlignment(.trailing)
                
            }
            .frame(width: width, height: height)
        })
            .buttonStyle(CustomMinButtonStyle())
    }
}
