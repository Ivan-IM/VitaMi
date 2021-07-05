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
            Color.blue.contrast(10).opacity(0.8)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.9), radius: 5, x: 0, y: 0)
            
            HStack {
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left.circle")
                        .foregroundColor(Color.white)
                    Text("Cancel")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                })
                Spacer()
                Button(action: self.action,
                       label: {
                        Text("Print")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                       })
                Spacer()
                NavigationLink(
                    destination: Text("result blood test"),
                    label: {
                        Text("Save")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Image(systemName: "chevron.right.circle")
                            .foregroundColor(Color.white)
                    })
            }
            .padding(.horizontal, 10.0)
        }
        .frame(height: 50)
    }
}
