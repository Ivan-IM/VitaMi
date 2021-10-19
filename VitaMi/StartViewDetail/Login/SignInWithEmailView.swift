//
//  SignInWithEmailView.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-19.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct SignInWithEmailView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @Binding var showSheet: Bool
    @Binding var action: LoginView.Action?
    
    @State private var showAlert: Bool = false
    @State private var authError: EmailAuthError?
    
    var body: some View {
        VStack {
            TextField("Email Address",
                      text: self.$user.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            SecureField("Password", text: $user.password)
            HStack {
                Spacer()
                Button(action: {
                    self.action = .resetPW
                    self.showSheet = true
                }) {
                    Text("Forgot Password")
                }
            }.padding(.bottom)
            VStack(spacing: 10) {
                Button(action: {
                    FBAuth.authenticate(withEmail: self.user.email,
                                        password: self.user.password) { (result) in
                        switch result {
                        case .failure(let error):
                            self.authError = error
                            self.showAlert = true
                        case .success( _):
                            print("Signed in")
                        }
                    }
                }) {
                    Text("Login")
                        .padding(.vertical, 15)
                        .frame(width: 200)
                        .opacity(user.isLogInComplete ? 1 : 0.75)
                }
                .buttonStyle(CustomMinButtonStyle())
                .disabled(!user.isLogInComplete)
                .padding(.bottom, 15)
                Button(action: {
                    self.action = .signUp
                    self.showSheet = true
                }) {
                    Text("Sign Up")
                        .padding(.vertical, 15)
                        .frame(width: 200)
                }
                .buttonStyle(CustomMinButtonStyle())
                .padding(.bottom, 15)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Login failed"), message: Text(self.authError?.localizedDescription ?? "Unknown error."), dismissButton: .default(Text("OK")) {
                if self.authError == .incorrectPassword {
                    self.user.password = ""
                } else {
                    self.user.password = ""
                    self.user.email = ""
                }
            })
        }
        .padding(.top, 100)
        .frame(width: 300)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
}

struct SignInWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithEmailView(showSheet: .constant(false), action: .constant(.signUp))
    }
}
