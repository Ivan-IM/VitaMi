//
//  StartView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                Spacer()
                switch changer.startViewChanger {
                case .info:
                    InfoView()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .transition(.slide)
                        .animation(.default)
                        .zIndex(1)
                case .welcom:
                    WelcomView()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .transition(.slide)
                        .animation(.default)
                        .zIndex(1)
                }
                Spacer()
                CustomButtonView(buttonTitle: "Дальше", action: {
                    switch changer.startViewChanger {
                    case .info:
                        changer.startViewChanger = .welcom
                    case .welcom:
                        changer.mainViewChanger = .mainView
                        UserDefaults.standard.setValue(changer.mainViewChanger.rawValue, forKey: "MainViewChanger")
                    }
                }, width: 200, height: 50)
                    .disabled(userManager.showButtonView)
            }
            .padding()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(ViewChanger())
            .environmentObject(UserManager())
            .environmentObject(UserInfo())
    }
}
