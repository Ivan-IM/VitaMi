//
//  MainView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var changer: ViewChanger
    
    var body: some View {
        VStack(spacing: 30) {
            Text("""
                main
                """)
                .multilineTextAlignment(.center)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Button(action: {
                changer.loading = .symtomsView
            }, label: {
                Text("Next")
            })
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(ViewChanger())
    }
}
