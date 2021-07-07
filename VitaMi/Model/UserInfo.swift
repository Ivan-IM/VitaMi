//
//  UserInfo.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

class User: ObservableObject {
    
    @Published var symptomsList: [String] = []
    @Published var elementsList: [String] = []
    @Published var lowElementsList: [String] = []
    
    func elementsFilterAlgorinm() {
        Symtom.getSymptomsList().forEach { symptom in
            if symptomsList.contains(symptom.enName) {
                elementsList.append(contentsOf: symptom.elements)
            }
        }
        elementsList.forEach { element in
            if elementsList.filter({$0 == element}).count > 1 {
                lowElementsList.append(element)
            }
            else { return }
        }
    }
}
