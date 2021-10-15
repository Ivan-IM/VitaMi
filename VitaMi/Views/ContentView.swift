//
//  ContentView.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            Spacer()
            switch changer.mainViewChanger {
            case .startView:
                StartView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(1)
            case .mainView:
                MainView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(2)
            case .symptomsView:
                SymptomsView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(3)
            case .symptomsListView:
                SymptomsListView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(4)
            case .resultTestingView:
                ResultTestingView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(5)
            case .analysisView:
                AnalysisView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(AnyTransition.opacity.combined(with: .slide).animation(.default))
                    .zIndex(6)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewChanger())
            .environmentObject(UserManager())
    }
}
