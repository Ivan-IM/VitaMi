//
//  SymptomsListView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct SymptomsListView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Symtom.getSymptomsList()) { symptom in
                CustomCellSymptomsListView(title: symptom.ruName, isSelected: user.symptomsList.contains(symptom.enName)) {
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

struct SymptomsListView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsListView()
    }
}

struct CustomCellSymptomsListView: View {
    
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                    .foregroundColor(Color("text"))
                Spacer()
                if self.isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color("text"))
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
        }
        .frame(height: 40)
        .overlay(Capsule(style: .continuous).stroke())
    }
}
