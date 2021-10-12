//
//  ValueEditorView.swift
//  VitaMi
//
//  Created by Иван Маришин on 12.10.2021.
//

import SwiftUI

struct ValueEditorView: View {
    
    @EnvironmentObject var user: User
    @Environment(\.presentationMode) var presentationMode
    var element: ElementCD
    @State private var valueEl: Double = 0
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                Text(element.ruName ?? "")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
                    .padding()
                Text("Введите данные исследования крови на дефицит данного элемента:")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
                    .padding()
                TextField("\(element.value)", value: $valueEl, formatter: formatter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    element.value = valueEl
                    user.coreDM.updateCD()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Обновить")
                        Image(systemName: "arrow.counterclockwise.circle")
                    }
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                }
                
            }
        }
    }
    
}
