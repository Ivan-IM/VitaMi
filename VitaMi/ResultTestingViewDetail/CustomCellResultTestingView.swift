//
//  CustomCellResultTestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.10.2021.
//

import SwiftUI

struct CustomCellResultTestingView: View {
    
    let element: Element
    @State private var showInfo = false
    @State private var showList = false
    
    var body: some View {
        HStack {
            Text(self.element.ruName)
                .foregroundColor(Color("text"))
            Spacer()
            Button {
                showList.toggle()
            } label: {
                Image(systemName: "cart.circle")
                    .imageScale(.large)
            }
            .padding(.trailing, 8)
            Button {
                showInfo.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .imageScale(.large)
            }

        }
        .font(.system(size: 16, weight: .semibold, design: .rounded))
        .padding(10.0)
        .frame(height: 40)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray)))
        .sheet(isPresented: $showInfo) {
            ElementDetailView(element: element)
        }
        .sheet(isPresented: $showList) {
            FoodDetailView(element: element)
        }

    }
}
