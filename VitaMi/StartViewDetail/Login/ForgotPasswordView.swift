//
//  ForgotPasswordView.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-19.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var user: UserViewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlert: Bool = false
    @State private var errorString: String?
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(NSLocalizedString("Enter email address", comment: ""), text: $user.email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                Button(action: {
                    FBAuth.resetPassword(email: self.user.email) { (result) in
                        switch result {
                        case .failure(let error):
                            self.errorString = error.localizedDescription
                        case .success( _):
                            break
                        }
                        self.showAlert = true
                    }
                }) {
                    Text(NSLocalizedString("Reset", comment: ""))
                        .frame(width: 200)
                        .padding(.vertical, 15)
                        .opacity(user.isEmailValid(_email: user.email) ? 1 : 0.75)
                }
                .buttonStyle(CustomMinButtonStyle())
                .disabled(!user.isEmailValid(_email: user.email))
                
                Spacer()
            }.padding(.top)
                .frame(width: 300)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .navigationBarTitle(NSLocalizedString("Request a password reset", comment: ""), displayMode: .inline)
                .navigationBarItems(trailing: Button(NSLocalizedString("Dismiss", comment: "")) {
                    self.presentationMode.wrappedValue.dismiss()
                })
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(NSLocalizedString("Request a password reset", comment: "")), message: Text(self.errorString ?? NSLocalizedString("Success. Check your email.", comment: "")), dismissButton: .default(Text("OK")) {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                }
        }
    }
}


struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
