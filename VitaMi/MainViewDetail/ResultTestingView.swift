//
//  ResultTestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct ResultTestingView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var userManager: UserManager
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            TitleResultView()
                .padding(.horizontal, 16)
                .padding(.top, 16)
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.clear)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color(.white), lineWidth: 2))
                    .padding()
                ScrollViewResultView()
                    .padding()
            }
            CustomButtonView(buttonTitle: NSLocalizedString("Back", comment: ""), action: {
                changer.mainViewChanger = .mainView
            }, width: 260, height: 60)
        }
        .padding(.bottom, 16)
        .onAppear() {
            userManager.lowElementsList.removeAll()
            userManager.elementsFilterAlgorithm()
            if userManager.symptomsList.count > 9 {
                showingAlert.toggle()
            }
            if userManager.elementsAnalysis.isEmpty {
                userManager.showFinalResult = false
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(NSLocalizedString("Attention!", comment: "")), message: Text(NSLocalizedString("Large number of symptoms! Recheck the choice of symptoms. Otherwise, we recommend that you see your doctor to rule out the disease.", comment: "")), dismissButton: .cancel(Text("OK")))
        }
    }
}

struct ResultTestingView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTestingView().environmentObject(UserManager()).environmentObject(ViewChanger())
    }
}
