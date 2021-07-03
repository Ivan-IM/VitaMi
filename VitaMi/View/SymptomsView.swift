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
            }
            .frame(width: geometry.size.width)
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
    }
}

struct SymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
    }
}
