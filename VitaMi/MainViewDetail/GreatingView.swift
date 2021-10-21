//
//  GreatingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.10.2021.
//

import Firebase
import SwiftUI

struct GreatingView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var userInfo: UserInfo
    @State private var animateColor: Double = 0.4
    
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
                HStack {
                    Spacer()
                    Button {
                        FBAuth.logout { result in
                            print("Logged out")
                        }
                    } label: {
                        Image(systemName: "multiply.circle")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(Color("text"))
                    }
                    .padding(.trailing, 8)
                }
                Text("Hello \(userInfo.user.name)!")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color("text"))
                    .padding(.bottom, 16)
                Text(NSLocalizedString("The VitaMi laboratory is ready for diagnostics.", comment: ""))
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
                    .padding()
                
            }
        }
        .padding()
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: true)) {
                self.animateColor = 1.0
            }
            guard let uid = Auth.auth().currentUser?.uid else { return }
            FBFirestore.retrieveFBUser(uid: uid) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let user):
                    self.userInfo.user = user
                }
            }
        }
    }
}

struct GreatingView_Previews: PreviewProvider {
    static var previews: some View {
        GreatingView(width: 200, height: 200)
    }
}
