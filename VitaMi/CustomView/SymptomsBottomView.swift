//
//  CardListBottom.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

struct SymptomsBottomView: View {
    
    @Environment(\.presentationMode) var presentation
    @State private var showingAlert = false
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
                Button(action: {
                    showingAlert = true
                }, label: {
                    Text("Clear")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                })
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Clear the list"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Ok"), action: action), secondaryButton: .cancel())
                }
                Spacer()
                NavigationLink(
                    destination: ResultView(),
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
