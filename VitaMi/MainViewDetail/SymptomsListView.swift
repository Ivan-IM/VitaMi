//
//  SymptomsListView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct SymptomsListView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var userManager: UserManager
    @State private var showingClearAlert = false
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16).stroke(Color.gray.opacity(0.5))
                    .frame(height: 50)
                Text(NSLocalizedString("Symptoms List", comment: ""))
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
                ConnectBaseErrorView()
                    .opacity(userManager.symptomsCD.isEmpty ? 0.7:0)
                ScrollViewSymptomsListView()
                    .padding()
                    .opacity(userManager.symptomsCD.isEmpty ? 0:1)
            }
            HStack {
                CustomButtonView(buttonTitle: NSLocalizedString("Back", comment: ""), action: {
                    changer.mainViewChanger = .mainView
                }, width: 160, height: 50)
                Spacer()
                CustomButtonView(buttonTitle: NSLocalizedString("Clear", comment: ""), action: {
                    showingClearAlert.toggle()
                }, width: 160, height: 50)
            }
            .padding(.horizontal,16)
            .alert(isPresented: $showingClearAlert) {
                Alert(title: Text(NSLocalizedString("Clear", comment: "")), message: Text(NSLocalizedString("Are you sure you want to clear the symptoms list?", comment: "")), primaryButton: .destructive(Text("OK"), action: {
                    userManager.symptomsList.removeAll()
                    userManager.lowElementsList.removeAll()
                    userManager.showFinalResult = false
                }), secondaryButton: .cancel())
            }
        }
        .padding(.bottom, 16)
        .onDisappear {
            userManager.lowElementsList.removeAll()
            userManager.elementsFilterAlgorithm()
        }
    }
}

struct SymptomsListView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsListView()
            .environmentObject(ViewChanger())
            .environmentObject(UserManager())
    }
}
