//
//  SymptomsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

struct SymptomsView: View {
    
    @State var symptomsList: [String] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView {
                    ForEach(Symtom.getSymptomsList()) { symptom in
                        MultipleSelectionRow(title: symptom.ruName, isSelected: self.symptomsList.contains(symptom.enName)) {
                            if self.symptomsList.contains(symptom.enName) {
                                self.symptomsList.removeAll(where: { $0 == symptom.enName })
                            }
                            else {
                                self.symptomsList.append(symptom.enName)
                            }
                        }
                    }
                }.frame(width: geometry.size.width)
                VStack {
                    Spacer()
                    Button(action: {
                        print(symptomsList)
                    }, label: {
                        Text("Test Me")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                    })
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .background(Color.clear)
                    .cornerRadius(10)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .navigationBarHidden(true)
        .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
    }
}

struct SymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
    }
}
