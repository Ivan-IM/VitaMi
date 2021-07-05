//
//  SymptomsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

struct SymptomsView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        ZStack {
            
            ScrollView(showsIndicators: false) {
                ForEach(Symtom.getSymptomsList()) { symptom in
                    CustomCellSymptomView(title: symptom.ruName, isSelected: user.symptomsList.contains(symptom.enName)) {
                        if user.symptomsList.contains(symptom.enName) {
                            user.symptomsList.removeAll(where: { $0 == symptom.enName })
                        }
                        else {
                            user.symptomsList.append(symptom.enName)
                        }
                    }
                    .padding(.horizontal, 10.0)
                    .padding(.vertical, 2.0)
                }
                .padding(.top, 105.0)
                .padding(.bottom, 55.0)
            }
            .padding(.vertical, 8.0)
            VStack {
                SymptomsTopView()
                Spacer()
                SymptomsBottomView {
                    user.symptomsList.removeAll()
                    user.elementsList.removeAll()
                    user.lowElementsList.removeAll()
                    UserDefaults.standard.set(user.symptomsList, forKey: "SymptomsList")
                }
                
            }
            .padding(.all, 5.0)
        }
        .navigationBarHidden(true)
        .onDisappear(){
            UserDefaults.standard.set(user.symptomsList, forKey: "SymptomsList")
        }
    }
}

struct SymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
    }
}
