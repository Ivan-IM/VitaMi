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
            
            if !changer.infoViewDismiss {
                InfoManualView()
            } else {
                StartView()
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
