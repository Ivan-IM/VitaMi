//
//  ElementDetailView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct ElementDetailView: View {
    
    let element: Element
    
    var body: some View {
        VStack {
            Text(element.enName)
            Text(element.elementInfo)
            List {
                ForEach(element.ruProductInfo, id: \.self) { prod in
                    Text(prod)
                }
            }
            .background(Color.clear)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1.0)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .navigationBarHidden(true)
    }
}

struct ElementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ElementDetailView(element: Element(symbol: "Fe", enName: "Iron", ruName: "Железо", type: "", elementInfo: "", ruProductInfo: [], normalValue: [:], helper: [], blocker: []))
    }
}
