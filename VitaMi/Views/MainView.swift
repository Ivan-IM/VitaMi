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
            CustomButtonView(buttonTitle: "Start testing", action: {
                changer.mainViewChanger = .symptomsView
            }, width: 300, height: 60)
            CustomButtonView(buttonTitle: "Symptoms list", action: {
                changer.mainViewChanger = .symptomsListView
            }, width: 300, height: 60)
            CustomButtonView(buttonTitle: "Result", action: {
                user.lowElementsList.removeAll()
                user.elementsFilterAlgorithm()
                changer.mainViewChanger = .resultTestingView
            }, width: 300, height: 60)
            }
            Spacer()
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
