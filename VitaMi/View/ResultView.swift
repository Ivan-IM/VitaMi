//
//  ResultView.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var user: User
    @Environment(\.presentationMode) var presentation
    @State private var showingDetail = false
    @State private var elementName: String = ""
    
    var body: some View {
        ZStack {
            
            ScrollView(showsIndicators: false) {
                ForEach(Element.getElementsList()) { element in
                    if user.lowElementsList.contains(element.symbol) {
                        CustomCellResultView(title: element.ruName) {
                            showingDetail = true
                            elementName = element.symbol
                        }
                        .sheet(isPresented: $showingDetail, content: {
                            ElementDetailView(info: elementName)
                        })
                        .padding(.horizontal, 10.0)
                        .padding(.vertical, 2.0)
                    }
                }
                .padding(.top, 105.0)
                .padding(.bottom, 55.0)
            }
            .padding(.vertical, 8.0)
            VStack {
                ResultTopView(resultTitle: "result test")
                Spacer()
                ResultBottomView {
                    print(user.elementsList)
                }
            }
            .padding(.all, 5.0)
        }
        .navigationBarHidden(true)
        .onAppear(){
            //user.elementsFilterAlgorinm()
            Symtom.getSymptomsList().forEach { symptom in
                if user.symptomsList.contains(symptom.enName) {
                    user.elementsList.append(contentsOf: symptom.elements)
                }
            }
            user.elementsList.forEach { element in
                if user.elementsList.filter({$0 == element}).count > 1 {
                    user.lowElementsList.append(element)
                }
                else { return }
            }
        }
        .onDisappear(){
            user.elementsList.removeAll()
            user.lowElementsList.removeAll()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
