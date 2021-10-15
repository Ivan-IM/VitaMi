//
//  LoginView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import AuthenticationServices
import Firebase
import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var changer: ViewChanger
    @Environment(\.presentationMode) var presentationMode
    @State var coordinator: SigninWithAppleCoordinator?
    @Binding var showSignIn: Bool
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack(spacing: 50) {
                SigninWithAppleButton()
                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Capsule())
                    .onTapGesture {
                        self.coordinator = SigninWithAppleCoordinator()
                        if let coordinator = self.coordinator {
                            coordinator.startSignInWithAppleFlow {
                                print("Sign in with Apple")
                                
                                showSignIn = false
                            }
                        }
                    }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showSignIn: .constant(true))
    }
}
