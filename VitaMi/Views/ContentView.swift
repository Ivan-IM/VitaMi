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
            BackgroundView()
            
            switch changer.loading {
            case .startView:
                StartView()
            case .loginView:
                LoginView()
            case .mainView:
                MainView()
            case .symtomsView:
                SymptomsView()
            case .resultView:
                ResultTestingView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewChanger())
    }
}
