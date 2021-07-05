//
//  CardListTop.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

struct SymptomsTopView: View {

    var body: some View {
        ZStack {
            Color.blue.contrast(10).opacity(0.8)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.9), radius: 5, x: 0, y: 0)
            Text("Выберете симптомы, которые беспокоят Вас в последнее время")
                .font(.title2)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)

        }
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .fixedSize(horizontal: false, vertical: true)
    }
}
