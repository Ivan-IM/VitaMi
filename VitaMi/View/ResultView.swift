//
//  ResultView.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var user: User
    @State var elements: Array<String> = []
    @State var elementsList: Array<String> = []
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
            ZStack {
            ScrollView {
                ForEach(Element.getElementsList()) { element in
                    if elementsList.contains(element.name) {
                        CustomCellResultView(title: element.name) {
                            
                        }
                    }
                }
                .padding(.horizontal, 3.0)
                .padding(.vertical, 1.0)
                
                Button(action: {
                    print(elements)
                    print(elementsList)
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
            .padding(.vertical, 8.0)
            .shadow(color: Color.black.opacity(0.7), radius: 3, x: 0, y: 0)
            }
            .onAppear(){
                Symtom.getSymptomsList().forEach { symptom in
                    if self.user.symptomsList.contains(symptom.enName) {
                        elements.append(contentsOf: symptom.elements)
                    }
                }
                elements.forEach { element in
                    if elements.filter({$0 == element}).count > 1 {
                        elementsList.append(element)
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
