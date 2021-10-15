//
//  UserInfo.swift
//  VitaMi
//
//  Created by Иван Маришин on 15.10.2021.
//

import Foundation

class UserInfo: ObservableObject {
    enum FBAuthState {
        case undefined, signedOut, sigenIn
    }
    
    @Published var isUserAuthenticated: FBAuthState = .undefined
    
    func configureFBStateDidChange() {
        self.isUserAuthenticated = .signedOut
        //self.isUserAuthenticated = .sigenIn
    }
}
