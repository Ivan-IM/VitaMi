//
//  SymptomsListView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct SymptomsView: View {
    
    @EnvironmentObject var changer: ViewChanger
    
    var body: some View {
        VStack {
            ZStack {
                ContentSymptomsView()
                    .background(ContentCardView())
            }
            CustomButtonView(buttonTitle: "Back", action: {
                changer.mainViewChanger = .mainView
            }, width: 260, height: 60)
        }
    }
}

struct SymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
            .environmentObject(User())
            .environmentObject(ViewChanger())
    }
}


