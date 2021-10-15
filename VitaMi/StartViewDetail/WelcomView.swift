//
//  WelcomView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct WelcomView: View {
    
    @EnvironmentObject var userManager: UserManager
    @State private var showSignIn = false
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            HStack {
                let validation = Binding<String>(
                    get: { self.userManager.name },
                    set: { self.userManager.name = self.userManager.validator($0)}
                )
                
                TextField("Введите имя", text: validation, onCommit: {
                    userManager.showButton()
                })
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                    .offset(x: 25)
                
                ZStack {
                    Text("\(userManager.symbols)")
                        .foregroundColor(Color.red)
                        .multilineTextAlignment(.center)
                        .opacity(userManager.showButtonView ? 1:0)
                    
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(Color(.systemBlue))
                        .opacity(userManager.showButtonView ? 0:1)
                    
                    
                }.frame(width: 50)
            }
            .frame(width: width*0.8, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color.white, lineWidth: 2))
            .onAppear {
                if userManager.name.isEmpty {
                    userManager.showButtonView = true
                }
            }
            CustomButtonView(buttonTitle: "Sign In", action: {
                showSignIn.toggle()
            }, width: 200, height: 50)
                .padding()
        }
        .sheet(isPresented: $showSignIn) {
            LoginView(showSignIn: $showSignIn)
        }
    }
}

struct WelcomView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
            .environmentObject(UserManager())
    }
}
