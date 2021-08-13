//
//  ResultTestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct ResultTestingView: View {
    
    @EnvironmentObject var changer: ViewChanger
    
    var body: some View {
        VStack {
            ZStack {
                ContentCardView()
                ScrollViewResultView()
            }
            CustomButtonView(buttonTitle: "Back", action: {
                changer.mainViewChanger = .mainView
            }, width: 260, height: 60)
        }
    }
}

struct ResultTestingView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTestingView().environmentObject(User()).environmentObject(ViewChanger())
    }
}
