//
//  SymtomList.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import Foundation

struct Symtom {
    let id = UUID()
    let name: String
    let elements: Array<String>
    
    static func getSymptomsList() -> [Symtom] {
        [
            Symtom(name: "muscle spasm", elements: ["", "K", "", "Ca", "", "Mg", "", "Na", "Vitamin", "D"]),
            Symtom(name: "muscle pain", elements: ["", "K", "", "Ca", "", "Mg", "", "P", "Vitamin", "D"]),
            Symtom(name: "bone fractures (more often than once a year or when falling from a height of one's own growth)", elements: ["", "Ca", "", "Cu", "Vitamin", "A", "Vitamin", "D"]),
            Symtom(name: "edemas", elements: ["", "Fe", "", "Na", "Vitamin", "B6", "Vitamin", "C"])
        ]
    }
}
