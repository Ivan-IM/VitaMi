//
//  ScrollViewSsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct ScrollViewSsView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("Symtoms")
                .padding(.top, 100)
            ForEach(Symtom.getSymptomsList()) { symptom in
                CustomCellSsView(title: symptom.ruName, isSelected: user.symptomsList.contains(symptom.enName)) {
                    if user.symptomsList.contains(symptom.enName) {
                        user.symptomsList.removeAll(where: { $0 == symptom.enName })
                    }
                    else {
                        user.symptomsList.append(symptom.enName)
                    }
                }
                .padding(.vertical, 2.0)
                .padding(.horizontal, 10.0)
            }
        }
    }
}
