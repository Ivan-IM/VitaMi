//
//  LoginView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            Text("""
                connect
                """)
                .multilineTextAlignment(.center)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
