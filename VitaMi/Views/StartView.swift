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
        Group {
            if userInfo.isUserAuthenticated == .undefined {
                InfoView()
            }
            else if userInfo.isUserAuthenticated == .signedOut {
                LoginView()
            }
            else {
                MainView()
                    .onAppear {
                        userManager.getFBSymptoms()
                        userManager.getFBElements()
                    }
            }
        }
        .onAppear {
            self.userInfo.configureFBStateDidChange()
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
