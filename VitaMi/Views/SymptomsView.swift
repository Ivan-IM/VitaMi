//
//  SymptomsListView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct SymptomsView: View {
    
    @EnvironmentObject var chager: ViewChanger
    @EnvironmentObject var user: User
    
    var body: some View {
        ZStack {
            VStack {
                ScrollViewSsView()
            }
            
            VStack {
                Spacer()
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.white, Color.white.opacity(0)]), startPoint: .bottom, endPoint: .top)
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    Button(action: {
                        chager.loading = .resultView
                    }, label: {
                        Text("Result")
                    })
                    .padding()
                    .overlay(Capsule().stroke())
                }
            }
        }
        .onDisappear() {
            user.elementsFilterAlgorithm()
        }
    }
}

struct SymptomsListView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView().environmentObject(User()).environmentObject(ViewChanger())
    }
}


