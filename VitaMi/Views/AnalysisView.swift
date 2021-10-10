//
//  AnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct AnalysisView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var user: User
    @State private var showingClearAlert = false
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16).stroke(Color.gray.opacity(0.5))
                    .frame(height: 50)
                Text("Результат лабораторного анализа")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.clear)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color.white, lineWidth: 2))
                    .padding()
                HealthyImageView()
                    .opacity(user.elementsAnalysis.isEmpty ? 0.7:0)
                ScrollViewAnalysisView()
                    .padding()
                    .opacity(user.elementsAnalysis.isEmpty ? 0:1)
            }
            HStack {
                CustomButtonView(buttonTitle: "Назад", action: {
                    changer.mainViewChanger = .mainView
                }, width: 160, height: 50)
                Spacer()
                CustomButtonView(buttonTitle: "Очистить", action: {
                    showingClearAlert.toggle()
                }, width: 160, height: 50)
            }
            .padding(.horizontal,16)
            .alert(isPresented: $showingClearAlert) {
                Alert(title: Text("Очистка"), message: Text("Вы действительно хотите очистить список?"), primaryButton: .destructive(Text("Ok"), action: {
                    user.elementsAnalysis.removeAll()
                }), secondaryButton: .cancel())
            }
            .onAppear {
                user.getElementsAnalysis()
                print("\(user.elementsAnalysis.count)")
            }
        }
        .padding(.bottom, 16)
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
