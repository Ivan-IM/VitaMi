//
//  CellSymptomsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct CustomCellSymptomsListView: View {
    
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                    .foregroundColor(Color(.systemGray))
                Spacer()
                if self.isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color(.systemGray))
                }
            }
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .padding(10.0)
        }
        .frame(height: 40)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray)))
    }
}
