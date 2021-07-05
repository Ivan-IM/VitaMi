//
//  ResultBottomView.swift
//  VitaMi
//
//  Created by Иван Маришин on 05.07.2021.
//

import SwiftUI

struct ResultBottomView: View {
    
    @Environment(\.presentationMode) var presentation
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Color.blue.contrast(10).opacity(0.5)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.9), radius: 5, x: 0, y: 0)
            
            HStack {
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left.circle")
                    Text("Cancel")
                })
                .frame(width: 100, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0, y: 0)
                Spacer()
                Button(action: self.action,
                       label: {
                        Text("Print")
                       })
                    .frame(width: 80, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0, y: 0)
                Spacer()
                NavigationLink(
                    destination: Text("result blood test"),
                    label: {
                    Text("Save")
                    Image(systemName: "chevron.right.circle")
                })
                .frame(width: 100, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0, y: 0)
            }
            .padding(.horizontal, 10.0)
        }
        .frame(height: 50)
    }
}
