//
//  FoodDetailView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.10.2021.
//

import SwiftUI

struct FoodDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let element: ElementCD
    
    var body: some View {
        List {
            Text("Продукты с высоким содержанием \(element.symbol ?? ""):")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(Color("text"))
                .padding()
            ForEach(element.ruProductInfo ?? [], id: \.self) { food in
                Text(food)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
            }
        }
        .colorMultiply(Color("background"))
    }
}
