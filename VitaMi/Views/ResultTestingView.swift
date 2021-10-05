//
//  ResultTestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct ResultTestingView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.clear)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color(.white), lineWidth: 2))
                    .padding()
                ScrollViewResultView()
                    .padding(26)
                    .opacity(user.lowElementsList.isEmpty ? 0:1)
            }
            CustomButtonView(buttonTitle: "Назад", action: {
                changer.mainViewChanger = .mainView
            }, width: 260, height: 60)
        }
        .padding(.bottom, 16)
        .onAppear() {
            user.lowElementsList.removeAll()
            user.elementsFilterAlgorithm()
        }
    }
}

struct ResultTestingView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTestingView().environmentObject(User()).environmentObject(ViewChanger())
    }
}
