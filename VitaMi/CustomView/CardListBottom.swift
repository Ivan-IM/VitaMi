//
//  CardListBottom.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

struct CardListBottom: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.9)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0, y: 0)
            
            HStack {
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    Text("Last")
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Save")
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Next")
                })
            }
            .padding(.horizontal, 10.0)
        }
        .frame(height: 50)
        .fixedSize(horizontal: false, vertical: true)
    }
}
