//
//  CustomCellAnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct CustomCellAnalysisView: View {
    
    var element: ElementAnalysis
    @State private var value: Double = 0.0
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    var body: some View {
        HStack {
            Text(element.symbol)
            Spacer()
            Button {
                self.element.value = value
                print("\(element.value)")
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath")
            }

            TextField("0.0", value: $value, formatter: formatter)
                .frame(width: 50)
                .multilineTextAlignment(.trailing)
            Text("\(element.value)")
        }
        .font(.system(size: 16, weight: .semibold, design: .rounded))
        .foregroundColor(Color("text"))
        .padding(10.0)
        .frame(height: 40)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray)))
    }
}

struct CustomCellAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCellAnalysisView(element: ElementAnalysis(symbol: "Na", value: 0))
    }
}
