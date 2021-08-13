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
        ZStack {
            VStack {
                Text(element.enName)
            }
        }
        .font(.system(size: 20, weight: .semibold, design: .rounded))
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .navigationBarHidden(true)
        .background(ZStack {
            Color("backgroundColorSet")
                .ignoresSafeArea()
            ContentCardView()
        })
    }
}

struct ElementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ElementDetailView(element: Element(symbol: "Fe", enName: "Iron", ruName: "Железо", type: "", elementInfo: "", ruProductInfo: [], normalValue: [:], helper: [], blocker: []))
    }
}
