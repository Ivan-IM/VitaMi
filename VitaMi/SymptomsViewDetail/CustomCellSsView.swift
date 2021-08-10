//
//  CellSymptomsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct CustomCellSsView: View {
    
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                    .foregroundColor(Color("text"))
                Spacer()
                if self.isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color("text"))
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
        }
        .frame(height: 40)
        .overlay(Capsule(style: .continuous).stroke())
    }
}
