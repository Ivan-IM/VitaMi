//
//  UserFormView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct UserFormView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("backgroundColorSet").opacity(0.5))
                .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color(.white), lineWidth: 2))
            VStack(spacing: 15) {
                TextField("Enter your name", text: $user.name)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(.gray).opacity(0.5)))
                TextField("Enter your gender", text: $user.gender)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(.gray).opacity(0.5)))
                TextField("Enter your age", text: $user.age)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(.gray).opacity(0.5)))
            }
            .padding()
        }
        .padding()
    }
}

struct UserFormView_Previews: PreviewProvider {
    static var previews: some View {
        UserFormView().environmentObject(User())
    }
}
