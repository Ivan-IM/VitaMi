//
//  ContentView.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var changer: ViewChanger
    
    var body: some View {
        ZStack {
            Color("backgroundColorSet")
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
                    .transition(.slide)
                    .animation(.default)
                    .zIndex(3)
            case .resultTestingView:
                ResultTestingView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(.slide)
                    .animation(.default)
                    .zIndex(4)
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
