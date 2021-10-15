//
//  UserInfo.swift
//  VitaMi
//
//  Created by Иван Маришин on 15.10.2021.
//

import FirebaseAuth
import Foundation

class UserInfo: ObservableObject {
    enum FBAuthState {
        case undefined, signedOut, sigenIn
    }
    
    @Published var isUserAuthenticated: FBAuthState = .undefined
    @Published var user: FBUser = .init(uid: "", name: "", email: "")
    
    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    
    func configureFBStateDidChange() {
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ _, user in
            guard let user = user else {
                self.isUserAuthenticated = .signedOut
                return
            }
            self.isUserAuthenticated = .sigenIn
            FBFirestore.retrieveFBUser(uid: user.uid) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let user):
                    self.user = user
                }
            }
        })
    }
}
