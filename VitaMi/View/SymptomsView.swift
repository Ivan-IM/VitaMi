//
//  SymptomsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

struct SymptomsView: View {
    
    @ObservedObject var user = User()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView(showsIndicators: false) {
                    ForEach(Symtom.getSymptomsList()) { symptom in
                        MultipleSelectionRow(title: symptom.ruName, isSelected: self.user.symptomsList.contains(symptom.enName)) {
                            if self.user.symptomsList.contains(symptom.enName) {
                                self.user.symptomsList.removeAll(where: { $0 == symptom.enName })
                            }
                            else {
                                self.user.symptomsList.append(symptom.enName)
                            }
                        }
                        .padding(.all, 3.0)
                    }
                    .padding(.top, 105.0)
                    .padding(.bottom, 55.0)
                }
                .padding(.vertical, 8.0)
                .shadow(color: Color.black.opacity(0.7), radius: 3, x: 0, y: 0)
                VStack {
                    CardListTop()
                    Spacer()
                    CardListBottom()
                    
                }
                .padding(.vertical, 5.0)
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
