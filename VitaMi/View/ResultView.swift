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
            ScrollView {
                ForEach(Element.getElementsList()) { element in
                    if user.lowElementsList.contains(element.name) {
                        CustomCellResultView(title: element.name) {
                            showingDetail = true
                        }
                    }
                }
                .sheet(isPresented: $showingDetail, content: {
                    ElementDetailView()
                })
                .padding(.horizontal, 3.0)
                .padding(.vertical, 1.0)
                
                Button(action: {
                    print(user.elementsList)
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
            .padding(.vertical, 8.0)
            }
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
        .navigationBarHidden(true)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
