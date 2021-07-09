//
//  ResultTopView.swift
//  VitaMi
//
//  Created by Иван Маришин on 05.07.2021.
//

import SwiftUI

struct ResultTopView: View {
    
    var resultTitle: String

    var body: some View {
        ZStack {
            Color.blue.contrast(10).opacity(0.8)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.9), radius: 5, x: 0, y: 0)
            VStack {
                Text(resultTitle)
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Spacer()
                Text("some information")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}
