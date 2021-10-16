//
//  MainView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            Spacer()
            switch changer.mainViewChanger {
            case .mainView:
                MainScreenView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(1)
            case .symptomsView:
                SymptomsView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(2)
            case .symptomsListView:
                SymptomsListView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(3)
            case .resultTestingView:
                ResultTestingView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(4)
            case .analysisView:
                AnalysisView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(5)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewChanger())
            .environmentObject(UserManager())
            .environmentObject(UserInfo())
    }
}
