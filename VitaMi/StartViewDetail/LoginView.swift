//
//  LoginView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    var body: some View {
        VStack(spacing: 50) {
            SignInWithAppleButton { (request) in
                
            } onCompletion: { (request) in
            }
            .signInWithAppleButtonStyle(.black)
            .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipShape(Capsule())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Terms & Privacy")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
            })
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
