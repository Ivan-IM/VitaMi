//
//  CustomCell.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .leading, endPoint: .trailing).cornerRadius(15)
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
    }
}

