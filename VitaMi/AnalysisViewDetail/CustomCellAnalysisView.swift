//
//  CustomCellAnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct CustomCellAnalysisView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(title)
        }
        .font(.system(size: 16, weight: .semibold, design: .rounded))
        .padding(10.0)
        .frame(height: 40)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray)))
    }
}

struct CustomCellAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCellAnalysisView(title: "Na")
    }
}
