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
    @State private var showingUpdateAlert: Bool = false
    @State private var showingResultAlert: Bool = false
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
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
                Button {
                    showingResultAlert.toggle()
                } label: {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 30, weight: .regular))
                        .imageScale(.large)
                        .foregroundColor(Color.green)
                }
                .position(x: width*0.2, y: height*0.65)
                .alert(isPresented: $showingResultAlert) {
                    Alert(title: Text("Результат"), message: Text("Вы внесли данные анализа на дефицит микроэлементов и витаминов. Обновить результаты тестирования?"), primaryButton: .destructive(Text("Ok"), action: {
                        user.showFinalResult = true
                        changer.mainViewChanger = .resultTestingView
                    }), secondaryButton: .cancel())
                }
                Button {
                    showingUpdateAlert.toggle()
                } label: {
                    Image(systemName: "checkmark.circle.trianglebadge.exclamationmark")
                        .font(.system(size: 30, weight: .regular))
                        .imageScale(.large)
                        .foregroundColor(Color.orange)
                }
                .disabled(user.elementsAnalysis == user.lowElementsList ? true:false)
                .opacity(user.elementsAnalysis == user.lowElementsList ? 0:0.8)
                .position(x: width*0.8, y: height*0.65)
                .alert(isPresented: $showingUpdateAlert) {
                    Alert(title: Text("Внимание"), message: Text("Выбор симптомов и результат тестирования изменен. Хотите обновить список микроэлементов и витаминов для анализа?"), primaryButton: .destructive(Text("Ok"), action: {
                        user.elementsAnalysis.removeAll()
                        user.elementsAnalysis = user.lowElementsList
                    }), secondaryButton: .cancel())
                }
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
                Alert(title: Text("Очистка"), message: Text("Вы действительно хотите сбросить результаты последнего тестирования? Это приведет к потере данных"), primaryButton: .destructive(Text("Ok"), action: {
                    user.elementsAnalysis.removeAll()
                    user.showFinalResult = false
                    user.clearCDElemantValue()
                }), secondaryButton: .cancel())
            }
            .onAppear {
                if user.elementsAnalysis.isEmpty {
                    user.showFinalResult = false
                    user.elementsAnalysis = user.lowElementsList
                }
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
