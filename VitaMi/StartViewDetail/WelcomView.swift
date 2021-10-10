//
//  WelcomView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct WelcomView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        HStack {
            let validation = Binding<String>(
                get: { self.user.name },
                set: { self.user.name = self.user.validator($0)}
            )
            
            TextField("Введите имя", text: validation, onCommit: {
                user.showButton()
            })
                .multilineTextAlignment(.center)
                .frame(width: 250)
                .offset(x: 25)
            
            ZStack {
                Text("\(user.symbols)")
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                    .opacity(user.showButtonView ? 1:0)
                
                Image(systemName: "checkmark.circle")
                    .foregroundColor(Color(.systemBlue))
                    .opacity(user.showButtonView ? 0:1)
                
                
            }.frame(width: 50)
        }
        .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color.white, lineWidth: 2))
        .onAppear {
            if user.name.isEmpty {
                user.showButtonView = true
            }
        }
    }
}

struct WelcomView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
            .environmentObject(User())
    }
}
