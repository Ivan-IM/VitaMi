//
//  SymptomsListView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct SymptomsView: View {
    
    @EnvironmentObject var changer: ViewChanger
    
    var body: some View {
        VStack {
            ZStack {
                ContentSymptomsView()
                    .background(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color(.white), lineWidth: 2))
                    )
                    .padding()
            }
            CustomButtonView(buttonTitle: "Назад", action: {
                changer.mainViewChanger = .mainView
            }, width: 260, height: 60)
        }
        .padding(.bottom, 16)
    }
}

struct SymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
            .environmentObject(User())
            .environmentObject(ViewChanger())
    }
}


