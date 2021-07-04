//
//  CardListTop.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

struct CardListTop: View {

    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(10)
        }
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .fixedSize(horizontal: false, vertical: true)
        .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0, y: 0)
    }
}
