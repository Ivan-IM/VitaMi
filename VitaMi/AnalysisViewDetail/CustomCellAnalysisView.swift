//
//  CustomCellAnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct CustomCellAnalysisView: View {
    
    var element: ElementCD
    @State private var showEditor = false
    
    var body: some View {
        Button {
            showEditor.toggle()
        } label: {
            HStack {
                Text(element.ruName ?? "")
                Spacer()
                Text("\(element.value)")
                Text(element.measure ?? "")
            }
        }
        .font(.system(size: 16, weight: .semibold, design: .rounded))
        .foregroundColor(Color("text"))
        .padding(10.0)
        .frame(height: 40)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray)))
        .sheet(isPresented: $showEditor) {
            
        }

    }
}
