//
//  CustomCellAnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct CustomCellAnalysisView: View {
    
    @EnvironmentObject var user: UserManager
    var element: ElementCD
    @State private var valueEl: Double?
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        HStack {
            Text(element.symbol ?? "")
            Spacer()
            TextField("\(element.elValue)", value: $valueEl, formatter: formatter, onCommit: {
                element.elValue = valueEl ?? element.elValue
                user.coreDM.updateCD()
            })
                .multilineTextAlignment(.trailing)
                .frame(width: 80)
            Text(element.measure ?? "")
        }
        .font(.system(size: 16, weight: .semibold, design: .rounded))
        .foregroundColor(Color("text"))
        .padding(10.0)
        .frame(height: 40)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray)))
    }
}
