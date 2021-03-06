//
//  FoodDetailView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.10.2021.
//

import SwiftUI

struct FoodDetailView: View {
    
    @EnvironmentObject var userManager: UserManager
    @Environment(\.presentationMode) var presentationMode
    let element: ElementCD
    
    var body: some View {
        List {
            Text("Foods high in \(element.symbol ?? ""):")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(Color("text"))
                .padding()
            ForEach(userManager.ruLocalization ? element.ruProductInfo ?? [] : element.enProductInfo ?? [], id: \.self) { food in
                Text(food)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
            }
        }
        .colorMultiply(Color("background"))
    }
}
