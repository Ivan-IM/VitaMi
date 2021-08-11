//
//  StartView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var changer: ViewChanger
    
    var body: some View {
        ZStack {
            Color("backgroundColorSet")
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
                case .login:
                    LoginView()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .transition(.slide)
                        .animation(.default)
                        .zIndex(1)
                }
                Spacer()
                Button(action: {
                    switch changer.startViewChanger {
                    case .info:
                        changer.startViewChanger = .login
                    case .login:
                        changer.mainViewChanger = .mainView
                    }
                }, label: {
                    Text("Next")
                        .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                .buttonStyle(CustomButtonStyle())
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().environmentObject(ViewChanger())
    }
}
