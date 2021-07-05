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
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ForEach(Element.getElementsList()) { element in
                    if user.lowElementsList.contains(element.name) {
                        CustomCellResultView(title: element.name) {
                            showingDetail = true
                        }.sheet(isPresented: $showingDetail, content: {
                            ElementDetailView(info: element.name)
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
            .padding(.vertical, 5.0)
        }
        .padding(.horizontal, 5.0)
        .navigationBarHidden(true)
        .onAppear(){
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
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
