//
//  ScrollViewAnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct ScrollViewAnalysisView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(user.symptoms) { symptom in
                CustomCellSymptomsListView(title: symptom.ruName, isSelected: user.symptomsList.contains(symptom.enName)) {
                    if user.symptomsList.contains(symptom.enName) {
                        user.symptomsList.removeAll(where: { $0 == symptom.enName })
                    }
                    else {
                        user.symptomsList.append(symptom.enName)
                    }
                }
                .padding(.vertical, 3.0)
                .padding(.horizontal, 10.0)
            }
            .padding(.vertical, 6.0)
        }
        .padding(.vertical, 2)
        .padding(.horizontal, 8)
    }
}

struct ScrollViewAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewAnalysisView()
    }
}
