//
//  ScrollViewSsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct ScrollViewSymptomsListView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(userManager.symptomsCD) { symptom in
                CustomCellSymptomsListView(title: symptom.ruName ?? "", isSelected: userManager.symptomsList.contains(symptom.enName ?? "")) {
                    if userManager.symptomsList.contains(symptom.enName ?? "") {
                        userManager.symptomsList.removeAll(where: { $0 == symptom.enName })
                    }
                    else {
                        userManager.symptomsList.append(symptom.enName ?? "")
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
