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
            Symtom(enName: "muscle pain and(or) spasm",
                   ruName: "боли и(или) спазмы мышц",
                   elements: ["K", "Ca", "Mg", "Na", "P", "Vitamin D"]),
            Symtom(enName: "bone fractures (more often than once a year)",
                   ruName: "переломы (чаще 1 раза в год)",
                   elements: ["Ca", "Ca", "Cu", "Vitamin A", "Vitamin D"]),
            Symtom(enName: "edemas",
                   ruName: "отеки",
                   elements: ["Fe", "Na", "Vitamin B6", "Vitamin C"]),
            Symtom(enName: "acne",
                   ruName: "угревая сыпь",
                   elements: ["K", "Na", "I", "Zn", "Vitamin F"]),
            Symtom(enName: "dermatitis",
                   ruName: "дерматит",
                   elements: ["Na", "Zn", "Vitanim PP", "Vitanim B5", "Vitamin B6", "Vitamin F"]),
            Symtom(enName: "bone and(or) join pain",
                   ruName: "боль в костях и(или) суставах",
                   elements: ["Ca", "Cu", "P", "Vitanim P", "Vitamin D"]),
            Symtom(enName: "dry skin",
                   ruName: "сухость кожи",
                   elements: ["Fe", "K", "Zn", "Vitanim B2", "Vitanim B9", "Vitamin A", "Vitamin F"]),
            Symtom(enName: "hair loss and brittleness",
                   ruName: "выпадение и ломкость волос",
                   elements: ["K", "Zn", "Vitanim B2", "Vitanim B5", "Vitamin A", "Vitamin F"]),
            Symtom(enName: "skin numbness",
                   ruName: "периодическое онемение кожи",
                   elements: ["Fe", "Ca", "I", "Vitanim B1", "Vitamin B6", "Vitanim B12", "Vitamin D", "Vitamin E"]),
            Symtom(enName: "deformation and fragility of nails",
                   ruName: "деформация и ломкость ногтей",
                   elements: ["Fe", "Zn", "Vitanim B2", "Vitanim B5", "Vitamin A"]),
            Symtom(enName: "pallor of skin", ruName: "бледность кожи", elements: ["Fe", "Cu", "Vitamin B6", "Vitanim B9", "Vitanim B12", "Vitamin C", "Vitamin E"]),
            Symtom(enName: "bleeding gums",
                   ruName: "кровоточивость десен",
                   elements: ["Vitanim P", "Vitanim P"]),
            Symtom(enName: "frequent bruising",
                   ruName: "частое появление синяков",
                   elements: ["Ca", "P", "Vitanim P", "Vitanim P", "Vitamin D"]),
            Symtom(enName: "white spots on the nails",
                   ruName: "белые пятна на ногтях",
                   elements: ["Zn", "Zn"]),
            Symtom(enName: "fading hair",
                   ruName: "выцветание волос",
                   elements: ["Cu", "Zn"]),
            Symtom(enName: "decreased appetite",
                   ruName: "снижение аппетита",
                   elements: ["Fe", "Mg", "Na", "I", "Zn", "Vitanim PP", "Vitanim B1", "Vitamin A"]),
            Symtom(enName: "abdominal pain",
                   ruName: "боль в животе",
                   elements: ["Ca", "Mg", "Zn", "Vitanim B9", "Vitamin D", "Vitamin F"]),
            Symtom(enName: "headache",
                   ruName: "головная боль",
                   elements: ["Fe", "Cu", "I", "Na", "Vitamin A"]),
            Symtom(enName: "thirst",
                   ruName: "жажда",
                   elements: ["K", "Na"]),
            Symtom(enName: "fatigue",
                   ruName: "утомляемость",
                   elements: ["Fe", "K", "Ca", "Mg", "I", "Cu", "P", "Zn", "Vitanim PP", "Vitamin B6", "Vitanim B9", "Vitanim B12", "Vitamin C", "Vitanim P", "Vitamin D", "Vitamin E"]),
            Symtom(enName: "depression",
                   ruName: "депрессия",
                   elements: ["K", "I", "P", "Zn", "Vitamin D", "Vitamin D"]),
            Symtom(enName: "dizziness",
                   ruName: "головокружение",
                   elements: ["Fe", "Cu", "Vitamin B6", "Vitanim B9", "Vitanim B12", "Vitamin C", "Vitamin E"]),
            Symtom(enName: "irritability",
                   ruName: "раздражительность",
                   elements: ["Fe", "Mg", "P", "Zn", "Vitanim PP", "Vitamin B6"]),
            Symtom(enName: "frequent colds",
                   ruName: "частые простуды",
                   elements: ["Cu", "P", "Vitanim B9", "Vitamin C", "Vitamin F"]),
            Symtom(enName: "cold intoleranc",
                   ruName: "непереносимость холода",
                   elements: ["Fe", "Fe"]),
            Symtom(enName: "memory impairment",
                   ruName: "ухудшение памяти",
                   elements: ["Fe", "P", "Vitanim B1", "Vitanim PP"]),
            Symtom(enName: "bad dream",
                   ruName: "плохой сон",
                   elements: ["Fe", "Mg", "Zn"]),
            Symtom(enName: "decreased visual acuity",
                   ruName: "снижение остроты зрения",
                   elements: ["Cu", "Zn", "Vitanim B1", "Vitamin A"]),
        ]
    }
}
