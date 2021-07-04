//
//  SymtomList.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import Foundation

struct Symtom: Identifiable {
    let id = UUID()
    let enName: String
    let ruName: String
    let elements: Array<String>
    
    static func getSymptomsList() -> [Symtom] {
        [
            Symtom(enName: "muscle spasm", ruName: "спазмы мышц", elements: ["K", "Ca", "Mg", "Na", "Vitamin D"]),
            Symtom(enName: "muscle pain", ruName: "боль в мышцах", elements: ["K", "Ca", "Mg", "P", "Vitamin D"]),
            Symtom(enName: "bone fractures (more often than once a year)", ruName: "переломы (чаще 1 раза в год)", elements: ["Ca", "Cu", "Vitamin A", "Vitamin D"]),
            Symtom(enName: "edemas", ruName: "отеки", elements: ["Fe", "Na", "Vitamin B6", "Vitamin C"]),
            Symtom(enName: "acne", ruName: "угревая сыпь", elements: ["K", "Na", "Zn", "Vitamin F"]),
            Symtom(enName: "dermatitis", ruName: "дерматит", elements: ["Na", "Zn", "Vitanim PP", "Vitanim B5", "Vitamin B6", "Vitamin F"]),
            Symtom(enName: "bone pain", ruName: "боль в костях", elements: ["Ca", "Cu", "P", "Vitanim P", "Vitamin D"]),
            Symtom(enName: "joint pain", ruName: "боль в суставах", elements: ["Ca", "Cu", "Vitanim P", "Vitamin A", "Vitamin D"]),
            Symtom(enName: "dry skin", ruName: "сухая кожа", elements: ["Fe", "K", "Zn", "Vitanim B2", "Vitanim B9", "Vitamin A", "Vitamin F"]),
            Symtom(enName: "hair loss and brittleness", ruName: "выпадение и ломкость волос", elements: ["K", "Zn", "Vitanim B2", "Vitanim B5", "Vitamin A", "Vitamin F"]),
            Symtom(enName: "skin numbness", ruName: "периодическое онемение кожи", elements: ["Fe", "Ca", "Vitanim B1", "Vitamin B6", "Vitanim B12", "Vitamin D", "Vitamin E"]),
            Symtom(enName: "deformation and fragility of nails", ruName: "деформация и ломкость ногтей", elements: ["Fe", "Zn", "Vitanim B2", "Vitanim B5", "Vitamin A"]),
            Symtom(enName: "pallor of skin", ruName: "бледность кожи", elements: ["Fe", "Cu", "Vitamin B6", "Vitanim B9", "Vitanim B12", "Vitamin C", "Vitamin E"]),
            Symtom(enName: "bleeding gums", ruName: "кровоточивость десен", elements: ["Vitanim P"]),
            Symtom(enName: "frequent bruising", ruName: "частое появление синяков", elements: ["Ca", "P", "Vitanim P", "Vitamin D"]),
            Symtom(enName: "white spots on the nails", ruName: "белые пятна на ногтях", elements: ["Zn"]),
            Symtom(enName: "fading hair", ruName: "выцветание волос", elements: ["Cu", "Zn"]),
            Symtom(enName: "decreased appetite", ruName: "снижение аппетита", elements: ["Fe", "Mg", "Na", "Zn", "Vitanim PP", "Vitamin A"]),
            Symtom(enName: "abdominal pain", ruName: "боль в животе", elements: ["Ca", "Mg", "Zn", "Vitanim B9", "Vitamin D", "Vitamin F"]),
            Symtom(enName: "headache", ruName: "головная боль", elements: ["Fe", "Cu", "Na", "Vitamin A"]),
            Symtom(enName: "thirst", ruName: "жажда", elements: ["K"]),
            Symtom(enName: "fatigue", ruName: "утомляемость", elements: ["Fe", "K", "Ca", "Mg", "Cu", "P", "Zn", "Vitanim PP", "Vitamin B6", "Vitanim B9", "Vitanim B12", "Vitamin C", "Vitanim P", "Vitamin D", "Vitamin E"]),
            Symtom(enName: "depression", ruName: "депрессия", elements: ["K", "P", "Zn", "Vitamin D"]),
            Symtom(enName: "dizziness", ruName: "головокружение", elements: ["Fe", "Cu", "Vitamin B6", "Vitanim B9", "Vitanim B12", "Vitamin C", "Vitamin E"]),
            Symtom(enName: "irritability", ruName: "раздражительность", elements: ["Fe", "Mg", "P", "Zn", "Vitanim PP", "Vitamin B6"]),
            Symtom(enName: "frequent colds", ruName: "частые простуды", elements: ["Cu", "P", "Vitanim B9", "Vitamin C", "Vitamin F"]),
            Symtom(enName: "cold intoleranc", ruName: "непереносимость холода", elements: ["Fe"]),
            Symtom(enName: "memory impairment", ruName: "ухудшение памяти", elements: ["Fe", "P", "Vitanim B1", "Vitanim PP"]),
            Symtom(enName: "bad dream", ruName: "плохой сон", elements: ["Fe", "Mg", "Zn"]),
            Symtom(enName: "decreased visual acuity", ruName: "снижение остроты зрения", elements: ["Cu", "Zn", "Vitanim B1", "Vitamin A"]),
        ]
    }
}
