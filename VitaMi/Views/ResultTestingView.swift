//
//  ResultTestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct ResultTestingView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var user: User
    var titleElementsDeficit: String = "Симптомы характерны для дефицита или сниженного потребления следующих микроэлементов и витаминов. Для более точного результата рекомендуем пройти обследование."
    var titleHealthy: String = "Ваше состояние не указывает на дефицит или сниженное потребление каких-либо микроэлементов и витаминов."
    
    var body: some View {
        VStack {
            Text(user.lowElementsList.isEmpty ? titleHealthy:titleElementsDeficit)
                .multilineTextAlignment(.center)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(Color("text"))
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(.gray).opacity(0.5)))
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.clear)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color(.white), lineWidth: 2))
                    .padding()
                HealthyImageView()
                    .opacity(user.lowElementsList.isEmpty ? 0.7:0)
                ScrollViewResultView()
                    .padding(26)
                    .opacity(user.lowElementsList.isEmpty ? 0:1)
            }
            CustomButtonView(buttonTitle: "Назад", action: {
                changer.mainViewChanger = .mainView
            }, width: 260, height: 60)
        }
        .padding(.bottom, 16)
        .onAppear() {
            user.lowElementsList.removeAll()
            user.elementsFilterAlgorithm()
        }
    }
}

struct ResultTestingView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTestingView().environmentObject(User()).environmentObject(ViewChanger())
    }
}
