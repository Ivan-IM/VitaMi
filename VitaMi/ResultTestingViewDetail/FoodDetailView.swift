//
//  FoodDetailView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.10.2021.
//

import SwiftUI

struct FoodDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let element: Element
    
    var body: some View {
        List {
            Text("Продукты с высоким содержанием \(element.symbol):")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(Color("text"))
                .padding()
            ForEach(element.ruProductInfo, id: \.self) { food in
                Text(food)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
            }
        }
        .colorMultiply(Color("background"))
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(element: Element(symbol: "Fe", enName: "Iron", ruName: "Железо", type: "", elementInfo: "bla bla bla bla bla", ruProductInfo: ["bla", "bla"], normalValue: [], helper: [], blocker: []))
    }
}
