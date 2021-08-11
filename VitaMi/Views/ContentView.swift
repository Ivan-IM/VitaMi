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
                    .transition(.slide)
                    .animation(.default)
                    .zIndex(1)
            case .mainView:
                MainView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(.slide)
                    .animation(.default)
                    .zIndex(2)
            case .symtomsView:
                SymptomsView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(.slide)
                    .animation(.default)
            case .resultView:
                ResultTestingView()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .transition(.slide)
                    .animation(.default)
            }
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
