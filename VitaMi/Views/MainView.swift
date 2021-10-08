//
//  MainView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            UserFormView()
            VStack(spacing: 25) {
                CustomButtonView(buttonTitle: "Начать тестирование", action: {
                    changer.mainViewChanger = .symptomsView
                }, width: 300, height: 60)
                    .disabled(user.symptoms.isEmpty ? true:false)
                CustomButtonView(buttonTitle: "Список симптомов", action: {
                    changer.mainViewChanger = .symptomsListView
                }, width: 300, height: 60)
                CustomButtonView(buttonTitle: "Результаты", action: {
                    changer.mainViewChanger = .resultTestingView
                }, width: 300, height: 60)
            }
            Spacer()
        }
        .onTapGesture {
            //UIApplication.shared.endEditing()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
