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
        .onDisappear(){
            UserDefaults.standard.set(user.symptomsList, forKey: "SymptomsList")
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
        ZStack {
            Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)).cornerRadius(20).opacity(0.8)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.7), radius: 3, x: 0, y: 0)

            Button(action: self.action) {
                HStack {
                    Text(self.title)
                        .foregroundColor(Color.black)
                    Spacer()
                    if self.isSelected {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.black)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
            }
        }
        .frame(height: 40)
    }
}
