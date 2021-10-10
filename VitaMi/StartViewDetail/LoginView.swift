//
//  LoginView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @Environment(\.presentationMode) var presentationMode
    @State var coordinator: SigninWithAppleCoordinator?
    
    var body: some View {
        VStack(spacing: 50) {
            SigninWithAppleButton()
                .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Capsule())
                .onTapGesture {
                    self.coordinator = SigninWithAppleCoordinator()
                    if let coordinator = self.coordinator {
                        coordinator.startSignInWithAppleFlow {
                            print("Sign in with Apple")
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            
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
