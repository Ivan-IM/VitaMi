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
        VStack(spacing: 30) {
            Text("""
                Some information
                about micronutrient
                imbalance
                """)
                .multilineTextAlignment(.center)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Button(action: {
                changer.loading = .loginView
            }, label: {
                Text("Next")
            })
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().environmentObject(ViewChanger())
    }
}
