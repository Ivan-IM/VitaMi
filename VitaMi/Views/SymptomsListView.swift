//
//  SymptomsListView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct SymptomsListView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var user: User
    @State private var showingClearAlert = false
    
    var body: some View {
        VStack {
            ZStack {
                ScrollViewSymptomsListView()
                    .background(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color(.white), lineWidth: 2))
                    )
                    .padding()
            }
            HStack {
                CustomButtonView(buttonTitle: "Назад", action: {
                    changer.mainViewChanger = .mainView
                }, width: 160, height: 50)
                Spacer()
                CustomButtonView(buttonTitle: "Очистить", action: {
                    showingClearAlert.toggle()
                }, width: 160, height: 50)
            }
            .padding(.horizontal,16)
            .alert(isPresented: $showingClearAlert) {
                Alert(title: Text("Очистка"), message: Text("Вы действительно хотите очистить список симптомов?"), primaryButton: .destructive(Text("Ok"), action: {
                    user.symptomsList.removeAll()
                    user.lowElementsList.removeAll()
                }), secondaryButton: .cancel())
            }
        }
        .padding(.bottom, 16)
    }
}

struct SymptomsListView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsListView()
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
