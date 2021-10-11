//
//  SigninWithAppleButton.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.10.2021.
//

import AuthenticationServices
import SwiftUI

struct SigninWithAppleButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
