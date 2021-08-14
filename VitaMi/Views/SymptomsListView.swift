//
//  SymptomsListView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct SymptomsListView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var user: User
    @State private var showingClearAlert = false
    
    var body: some View {
        VStack {
            ZStack {
                ScrollViewSymptomsListView()
                    .background(ContentCardView())
            }
            HStack {
                CustomButtonView(buttonTitle: "Back", action: {
                    changer.mainViewChanger = .mainView
                }, width: 160, height: 50)
                Spacer()
                CustomButtonView(buttonTitle: "Clear list", action: {
                    showingClearAlert.toggle()
                }, width: 160, height: 50)
            }
            .padding(.horizontal,16)
            .alert(isPresented: $showingClearAlert) {
                Alert(title: Text("Clear"), message: Text("Are you want clear symptoms list?"), primaryButton: .destructive(Text("Ok"), action: {
                    user.symptomsList.removeAll()
                    user.lowElementsList.removeAll()
                }), secondaryButton: .cancel())
            }
        }
        .padding(.bottom, 16)
    }
}

struct SymptomsListView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsListView()
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
