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
import AVFoundation

final class User: ObservableObject {
    //MARK: Base
    private let symptomsPath = "Symptoms"
    private let elementsPath = "Elements"
    private let store = Firestore.firestore()
    
    @Published var symptoms = [Symptom]()
    @Published var elements = [Element]()
    
    //MARK: User info
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "Name")
        }
    }
    
    @Published var symbols: Int = 0
    @Published var showButtonView: Bool = false
    
    //MARK: User simptoms info
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
    
    @Published var elementsAnalysis: [String] {
        didSet {
            UserDefaults.standard.set(elementsAnalysis, forKey: "ElementsAnalysis")
        }
    }
    
    //MARK: CoreData base
    let coreDM: CoreDataManager = CoreDataManager()
    
    @Published var symptomsCD: [SymptomCD] = [SymptomCD]()
    @Published var elementsCD: [ElementCD] = [ElementCD]()
    
    //MARK: init class
    init() {
        self.name = UserDefaults.standard.object(forKey: "Name") as? String ?? ""
        self.symptomsList = UserDefaults.standard.object(forKey: "SymptomsList") as? [String] ?? []
        self.lowElementsList = UserDefaults.standard.object(forKey: "LowElementsList") as? [String] ?? []
        self.elementsAnalysis = UserDefaults.standard.object(forKey: "ElementsAnalysis") as? [String] ?? []
        
        self.symptomsCD = coreDM.getSymptoms()
        self.elementsCD = coreDM.getElements()
        
        getBase()
    }
    
    //MARK: getBase method
    func getBase() {
        if self.symptomsCD.isEmpty {
            store.collection(symptomsPath).addSnapshotListener { snapshot, error in
                if let error = error {
                    print(error)
                    return
                }
                self.symptoms = snapshot?.documents.compactMap {
                    try? $0.data(as: Symptom.self)
                } ?? []
                for symptom in self.symptoms {
                    self.coreDM.saveSymptom(symptom: symptom)
                    self.symptomsCD = self.coreDM.getSymptoms()
                }
            }
        }
        if self.elementsCD.isEmpty {
            store.collection(elementsPath).addSnapshotListener { snapshot, error in
                if let error = error {
                    print(error)
                    return
                }
                self.elements = snapshot?.documents.compactMap {
                    try? $0.data(as: Element.self)
                } ?? []
                for element in self.elements {
                    self.coreDM.saveElement(element: element)
                    self.elementsCD = self.coreDM.getElements()
                }
            }
        }
        else {
            print("CoreData load")
            return
        }
    }
    
    //MARK: main Algorithm method
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
            
            symptomsCD.forEach { symptom in
                if symptomsList.contains(symptom.enName ?? "") {
                    elementsList.append(contentsOf: symptom.elements ?? [])
                    elementsList.append(contentsOf: symptom.elements ?? [])
                }
                else { return }
            }
            //print("All elements \(elementsList)")
            
            elementsList.forEach { element in
                if elementsList.filter({$0 == element}).count > 2 {
                    firstFilterList.append(element)
                }
                else { return }
            }
            //print("Double filtration \(firstFilterList)")
            
            elementsCD.forEach { element in
                if firstFilterList.contains(element.symbol ?? "") {
                    blockList.append(contentsOf: element.blocker ?? [])
                    helperList.append(contentsOf: element.helper ?? [])
                }
                else { return }
            }
            //print("Block list \(blockList)")
            //print("Help list \(helperList)")
            
            blockList.forEach() { element in
                if elementsList.contains(element) {
                    elementsList.remove(object: element)
                }
                else { return }
            }
            //print("Remove block \(elementsList)")
            
            elementsList.append(contentsOf: helperList)
            //print("Add help \(elementsList)")
            
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
            //print("Result \(lowElementsList)")
        }
    }
    
    //MARK: name validator method
    func validator(_ value: String) -> String {
        name = value
        symbols = name.count
        showButton()
        return name
    }
    
    func showButton() {
        if symbols < 1 {
            showButtonView = true
        }
        else {
            showButtonView = false
        }
    }
}
