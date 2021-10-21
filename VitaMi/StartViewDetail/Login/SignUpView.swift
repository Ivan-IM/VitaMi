//
//  SignUpView.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-19.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var showError: Bool = false
    @State private var errorString = ""

    var body: some View {
        NavigationView {
            VStack {
                Group {
                    VStack(alignment: .leading) {
                        TextField(NSLocalizedString("Full name", comment: ""), text: self.$user.fullname)
                            .autocapitalization(.words)
                        if !user.validNameText.isEmpty {
                            Text(user.validNameText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        TextField(NSLocalizedString("Email Address", comment: ""), text: self.$user.email)
                            .autocapitalization(.none).keyboardType(.emailAddress)
                        if !user.validEmailAddressText.isEmpty {
                            Text(user.validEmailAddressText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        SecureField(NSLocalizedString("Password", comment: ""), text: self.$user.password)
                        if !user.validPasswordText.isEmpty {
                            Text(user.validPasswordText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        SecureField(NSLocalizedString("Confirm Password", comment: ""), text: self.$user.confirmPassword)
                        if !user.passwordsMatch(_confirmPW: user.confirmPassword) {
                            Text(user.validConfirmPasswordText).font(.caption).foregroundColor(.red)
                        }
                    }
                }.frame(width: 300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                VStack(spacing: 20 ) {
                    Button(action: {
                        FBAuth.createUser(withEmail: self.user.email,
                                          name: self.user.fullname,
                                          password: self.user.password) { (result) in
                            switch result {
                            case .failure(let error):
                                self.errorString = error.localizedDescription
                                self.showError = true
                            case .success( _):
                                print("Account creation successful")
                            }
                        }
                    }) {
                        Text(NSLocalizedString("Register", comment: ""))
                            .frame(width: 200)
                            .padding(.vertical, 15)
                            .opacity(user.isSignInComplete ? 1 : 0.75)
                    }
                    .buttonStyle(CustomMinButtonStyle())
                    .disabled(!user.isSignInComplete)
                    Spacer()
                }.padding()
            }.padding(.top)
                .alert(isPresented: $showError) {
                    Alert(title: Text(NSLocalizedString("Account creation error", comment: "")), message: Text(self.errorString), dismissButton: .default(Text("OK")))
                }
                .navigationBarTitle(NSLocalizedString("Register", comment: ""), displayMode: .inline)
                .navigationBarItems(trailing: Button(NSLocalizedString("Dismiss", comment: "")) {
                    self.presentationMode.wrappedValue.dismiss()
                })
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
