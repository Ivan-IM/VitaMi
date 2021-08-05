//
//  FormView.swift
//  VitaMi
//
//  Created by Иван Маришин on 05.08.2021.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $user.name)
            TextField("Gender", text: $user.gender)
            TextField("Age", text: $user.age)
        }
        .padding(30)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.systemBlue), Color(.systemTeal)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(25)
        .padding(20)
        .shadow(color: .gray, radius: 5, x: 3, y: 3)
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView().environmentObject(User())
    }
}
