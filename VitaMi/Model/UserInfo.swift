//
//  UserInfo.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

class User: ObservableObject {
    
    @Published var symptomsList: [String] = []
    @Published var lowElementsList: [String] = []
    
    func elementsFilterAlgorinm() {
        var elementsList: [String] = []
        var blockList: [String] = []
        var helperList: [String] = []
        var firstFilterList: [String] = []

        Symtom.getSymptomsList().forEach { symptom in
            if symptomsList.contains(symptom.enName) {
                elementsList.append(contentsOf: symptom.elements)
                elementsList.append(contentsOf: symptom.elements)
            }
            else { return }
        }
        print("All elements \(elementsList)")
        
        elementsList.forEach { element in
            if elementsList.filter({$0 == element}).count > 2 {
                firstFilterList.append(element)
            }
            else { return }
        }
        print("Double filtration \(firstFilterList)")
        
        Element.getElementsList().forEach { element in
            if firstFilterList.contains(element.symbol) {
                blockList.append(contentsOf: element.blocker)
                helperList.append(contentsOf: element.helper)
            }
            else { return }
        }
        print("Block list \(blockList)")
        print("Help list \(helperList)")
        
        blockList.forEach() { element in
            if elementsList.contains(element) {
                elementsList.remove(object: element)
            }
            else { return }
        }
        print("Remove block \(elementsList)")
        
        elementsList.append(contentsOf: helperList)
        print("Add help \(elementsList)")
        
        elementsList.forEach { element in
            if elementsList.filter({$0 == element}).count > 3 {
                lowElementsList.append(element)
            }
            else { return }
        }
    }
}

extension Array where Element: Equatable {
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}
