//
//  CustomCell.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

struct CustomCellSymptomView: View {
    
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .leading, endPoint: .trailing).cornerRadius(20)
                .shadow(color: Color.black.opacity(0.7), radius: 3, x: 0, y: 0)
            Button(action: self.action) {
                HStack {
                    Text(self.title)
                        .foregroundColor(Color.black)
                    Spacer()
                    if self.isSelected {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.black)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
            }
        }
        .frame(height: 40)
    }
}
