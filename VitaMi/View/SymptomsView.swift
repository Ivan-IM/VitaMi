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
                ScrollView(showsIndicators: false) {
                    ForEach(Symtom.getSymptomsList()) { symptom in
                        MultipleSelectionRow(title: symptom.ruName, isSelected: self.symptomsList.contains(symptom.enName)) {
                            if self.symptomsList.contains(symptom.enName) {
                                self.symptomsList.removeAll(where: { $0 == symptom.enName })
                            }
                            else {
                                self.symptomsList.append(symptom.enName)
                            }
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all, 3.0/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.vertical, 100.0)
                }.frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: .black, radius: 3, x: 0, y: 0)
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
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 5, x: 0, y: 0)
                }
            }
        }
        .padding(.horizontal, 5.0)
        .navigationBarHidden(true)
    }
}

struct SymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
    }
}
