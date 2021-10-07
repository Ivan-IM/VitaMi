//
//  UserInfo.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI
import CoreMIDI
import FirebaseFirestore
import FirebaseFirestoreSwift

final class User: ObservableObject {
    private let symptomsPath = "Symptoms"
    private let elementsPath = "Elements"
    private let store = Firestore.firestore()
    
    @Published var symptoms: [Symptom] = []
    @Published var elements: [Element] = []
    
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "Name")
        }
    }
    @Published var gender: String {
        didSet {
            UserDefaults.standard.set(gender, forKey: "Gender")
        }
    }
    @Published var age: Int {
        didSet {
            UserDefaults.standard.set(age, forKey: "Age")
        }
    }
    
    @Published var symptomsList: [String] {
        didSet {
            UserDefaults.standard.set(symptomsList, forKey: "SymptomsList")
        }
    }
    @Published var lowElementsList: [String] {
        didSet {
            UserDefaults.standard.set(lowElementsList, forKey: "LowElementsList")
        }
    }
    
    init() {
        self.name = UserDefaults.standard.object(forKey: "Name") as? String ?? ""
        self.gender = UserDefaults.standard.object(forKey: "Gender") as? String ?? "Укажите пол"
        self.age = UserDefaults.standard.object(forKey: "Age") as? Int ?? 0
        self.symptomsList = UserDefaults.standard.object(forKey: "SymptomsList") as? [String] ?? []
        self.lowElementsList = UserDefaults.standard.object(forKey: "LowElementsList") as? [String] ?? []
        getBase()
    }
    
    func getBase() {
        store.collection(symptomsPath).addSnapshotListener { snapshot, error in
            if let error = error {
                print(error)
                return
            }
            self.symptoms = snapshot?.documents.compactMap {
                try? $0.data(as: Symptom.self)
            } ?? []
        }
        store.collection(elementsPath).addSnapshotListener { snapshot, error in
            if let error = error {
                print(error)
                return
            }
            self.elements = snapshot?.documents.compactMap {
                try? $0.data(as: Element.self)
            } ?? []
        }
    }
    
//    func add() {
//        for i in Element.getElementsList() {
//            do {
//                _ = try store.collection(elementsPath).addDocument(from: i)
//            }
//            catch {
//                fatalError("Add")
//            }
//        }
//    }
    
    func elementsFilterAlgorithm() {
        var elementsList: [String] = []
        var blockList: [String] = []
        var helperList: [String] = []
        var firstFilterList: [String] = []
        
        if symptomsList.isEmpty {
            return
        }
        else {
            lowElementsList.removeAll()
            
            symptoms.forEach { symptom in
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
            
            elements.forEach { element in
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
                    if lowElementsList.contains(element) {
                        return
                    }
                    else {
                        lowElementsList.append(element)
                    }
                }
                else { return }
            }
            print("Result \(lowElementsList)")
        }
    }
    
}
