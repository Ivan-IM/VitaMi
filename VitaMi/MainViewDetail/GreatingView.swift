//
//  GreatingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.10.2021.
//

import Firebase
import SwiftUI

struct GreatingView: View {
    
    @State var userName: String
    @State var showSignIn = false
    @State private var animateColor: Double = 0.4
    @State private var buttonDisabled = false
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: "brain.head.profile")
                .font(.system(size: width/3.5, weight: .light))
                .imageScale(.large)
                .foregroundColor(Color("text").opacity(0.8))
                .shadow(color: Color.blue.opacity(animateColor), radius: 15, x: 0, y: 0)
            VStack {
                Text("Привет \(userName)!")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color("text"))
                .padding()
                Text("Лаборатория VitaMi готова к диагностике.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
                .padding()
                CustomButtonView(buttonTitle: "Sign In", action: {
                    showSignIn.toggle()
                }, width: width/5, height: width/9)

            }
            .sheet(isPresented: $showSignIn) {
                LoginView()
            }
        }
        .padding()
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: true)) {
                self.animateColor = 1.0
            }
        }
    }
}

struct GreatingView_Previews: PreviewProvider {
    static var previews: some View {
        GreatingView(userName: "Neo", width: 200, height: 200)
    }
}
