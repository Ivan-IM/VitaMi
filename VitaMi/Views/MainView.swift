//
//  MainView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var user: User
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            Spacer()
            GreatingView(userName: user.name, width: width, height: height/4)
            Spacer()
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    CustomButtonMainView(buttonTitle: "Начать тестирование", imageName: "hand.tap", imageColor: .blue, action: {
                        changer.mainViewChanger = .symptomsView
                    }, width: width*0.41, height: width*0.41)
                        .disabled(user.symptoms.isEmpty ? true:false)
                        .padding()
                    CustomButtonMainView(buttonTitle: "Список симптомов", imageName: "doc.text.magnifyingglass", imageColor: .blue, action: {
                        changer.mainViewChanger = .symptomsListView
                    }, width: width*0.41, height: width*0.41)
                        .padding()
                }
                HStack(alignment: .center) {
                    CustomButtonMainView(buttonTitle: "Анализ", imageName: "eyedropper.halffull", imageColor: .green, action: {
                        changer.mainViewChanger = .analysisView
                        user.getElementsAnalysis()
                        print("\(user.elementsAnalysis)")
                    }, width: width*0.41, height: width*0.41)
                        .padding()
                    CustomButtonMainView(buttonTitle: "Результаты", imageName: "heart.text.square", imageColor: .green, action: {
                        changer.mainViewChanger = .resultTestingView
                    }, width: width*0.41, height: width*0.41)
                        .padding()
                }
            }
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
