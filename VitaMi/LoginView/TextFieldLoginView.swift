//
//  TextFieldLoginView.swift
//  VitaMi
//
//  Created by Иван Маришин on 05.08.2021.
//

import SwiftUI

struct TextFieldLoginView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            TextField("Login", text: $user.login) {
                
            }
            TextField("Password", text: $user.password) {
                
            }
        }
    }
}

struct TextFieldLoginView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldLoginView()
    }
}
