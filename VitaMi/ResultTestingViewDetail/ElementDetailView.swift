//
//  ElementDetailView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct ElementDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let element: Element
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                Text(element.ruName)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
                    .padding()
                ScrollView {
                    Text(element.elementInfo)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("text"))
                }
                .padding()
            }
        }
    }
}

//struct ElementDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ElementDetailView(element: Element(symbol: "Fe", enName: "Iron", ruName: "Железо", type: "", elementInfo: "bla bla bla bla bla", ruProductInfo: ["bla", "bla"], normalValue: [], helper: [], blocker: []))
//    }
//}
