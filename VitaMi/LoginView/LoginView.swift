//
//  LoginView.swift
//  VitaMi
//
//  Created by Иван Маришин on 05.08.2021.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        VStack {
            TextFieldLoginView()
            ButtonLoginView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(User())
    }
}
