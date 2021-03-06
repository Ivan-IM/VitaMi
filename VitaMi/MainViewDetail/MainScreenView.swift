//
//  MainScreenView.swift
//  VitaMi
//
//  Created by Иван Маришин on 16.10.2021.
//

import SwiftUI

struct MainScreenView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var userInfo: UserInfo
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            Spacer()
            GreatingView(width: width, height: height/4)
            Spacer()
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    CustomButtonMainView(buttonTitle: NSLocalizedString("Start Testing", comment: ""), imageName: "hand.tap", imageColor: .blue, action: {
                        changer.mainViewChanger = .symptomsView
                    }, width: width*0.41, height: width*0.41)
                        .disabled(userManager.symptomsCD.isEmpty ? true:false)
                        .padding()
                    CustomButtonMainView(buttonTitle: NSLocalizedString("Symptoms List", comment: ""), imageName: "doc.text.magnifyingglass", imageColor: .blue, action: {
                        changer.mainViewChanger = .symptomsListView
                    }, width: width*0.41, height: width*0.41)
                        .padding()
                }
                HStack(alignment: .center) {
                    CustomButtonMainView(buttonTitle: NSLocalizedString("Analysis", comment: ""), imageName: "eyedropper.halffull", imageColor: .green, action: {
                        changer.mainViewChanger = .analysisView
                    }, width: width*0.41, height: width*0.41)
                        .padding()
                    CustomButtonMainView(buttonTitle: NSLocalizedString("Results", comment: ""), imageName: "heart.text.square", imageColor: userManager.showFinalResult ? .green : .blue, action: {
                        changer.mainViewChanger = .resultTestingView
                    }, width: width*0.41, height: width*0.41)
                        .padding()
                }
            }
            Spacer()
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
            .environmentObject(ViewChanger())
            .environmentObject(UserManager())
            .environmentObject(UserInfo())
    }
}
