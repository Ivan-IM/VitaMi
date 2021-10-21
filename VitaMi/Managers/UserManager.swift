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

final class UserManager: ObservableObject {
    
    //MARK: User change system info
    @Published var ruLocalization: Bool = false
    @Published var showHealthy: Bool = false
    @Published var showFinalResult: Bool {
        didSet {
            UserDefaults.standard.set(showFinalResult, forKey: "ShowFinalResult")
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
    
    @Published var elementsAnalysis: [String] {
        didSet {
            UserDefaults.standard.set(elementsAnalysis, forKey: "ElementsAnalysis")
        }
    }
    
    //MARK: FireBase system base
    private let versionPath = "VersionFB"
    private let symptomsPath = "Symptoms"
    private let elementsPath = "Elements"
    private let store = Firestore.firestore()
    
    @Published var versionFB: Double {
        didSet {
            UserDefaults.standard.set(versionFB, forKey: "VersionFB")
        }
    }
    @Published var symptoms = [Symptom]()
    @Published var elements = [Element]()
    
    //MARK: CoreData system base
    let coreDM: CoreDataManager = CoreDataManager()
    
    @Published var symptomsCD: [SymptomCD] = [SymptomCD]()
    @Published var elementsCD: [ElementCD] = [ElementCD]()
    
    //MARK: init class
    init() {
        self.showFinalResult = UserDefaults.standard.object(forKey: "ShowFinalResult") as? Bool ?? false
        self.symptomsList = UserDefaults.standard.object(forKey: "SymptomsList") as? [String] ?? []
        self.lowElementsList = UserDefaults.standard.object(forKey: "LowElementsList") as? [String] ?? []
        self.elementsAnalysis = UserDefaults.standard.object(forKey: "ElementsAnalysis") as? [String] ?? []
        self.versionFB = UserDefaults.standard.object(forKey: "VersionFB") as? Double ?? 0.0
        
        if Locale.current.languageCode == "ru" {
            self.ruLocalization = true
        } else {
            self.ruLocalization = false
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
    
    //MARK: FireBase get base method
    func getVersionFB() {
        //Load CD
        self.symptomsCD = coreDM.getSymptoms()
        self.elementsCD = coreDM.getElements()
        
        var version = [VersionFB]()
        
        store.collection(versionPath).addSnapshotListener { snapshot, error in
            if let error = error {
                print(error)
                return
            }
            version = snapshot?.documents.compactMap {
                try? $0.data(as: VersionFB.self)
            } ?? []
            if version.isEmpty {
                print("Connection error FireStore")
            }
            else {
                if version.first?.version == self.versionFB {
                    print("Version FBase is not change - \(self.versionFB).")
                }
                else {
                    self.clearCDBase()
                    self.getFBSymptoms()
                    self.getFBElements()
                    self.versionFB = version.first?.version ?? 1.0
                    print("FBase version update to \(self.versionFB)")
                }
            }
        }
    }
    
    func getFBSymptoms() {
        store.collection(symptomsPath).addSnapshotListener { snapshot, error in
            if let error = error {
                print(error)
                return
            }
            self.symptoms = snapshot?.documents.compactMap {
                try? $0.data(as: Symptom.self)
            } ?? []
            print("FB load \(self.symptoms.count) symptoms")
            self.loadFireBaseSymptomsToCoreData()
        }
    }
    
    func getFBElements() {
        store.collection(elementsPath).addSnapshotListener { snapshot, error in
            if let error = error {
                print(error)
                return
            }
            self.elements = snapshot?.documents.compactMap {
                try? $0.data(as: Element.self)
            } ?? []
            print("FB load \(self.elements.count) elements")
            self.loadFireBaseElementsToCoreData()
        }
    }
    
    //MARK: CoreData get base method
    func loadFireBaseSymptomsToCoreData() {
        self.symptomsCD = coreDM.getSymptoms()
        if symptomsCD.isEmpty {
            for symptom in self.symptoms {
                self.coreDM.saveSymptom(symptom: symptom)}
            self.symptomsCD = self.coreDM.getSymptoms()
            print("CoreData load symptoms \(self.symptomsCD.count)")
        } else {
            print("CD error, symptoms list not empty")
        }
    }
    
    func loadFireBaseElementsToCoreData() {
        self.elementsCD = coreDM.getElements()
        if elementsCD.isEmpty {
            for element in self.elements {
                self.coreDM.saveElement(element: element)}
            self.elementsCD = self.coreDM.getElements()
            print("CoreData load elements \(self.elementsCD.count)")
        } else {
            print("CD error, elements list not empty")
        }
    }
    
    func clearCDBase() {
        for symptom in symptomsCD {
            coreDM.deleteSymptoms(symptom: symptom)
        }
        for element in elementsCD {
            coreDM.deleteElements(element: element)
        }
    }
    
    func clearCDElemantValue() {
        for element in elementsCD {
            element.elValue = 0
        }
        coreDM.updateCD()
    }
    
    //MARK: update status
    func showHealthyStatus() {
        var resultIndex = 0
        for element in elementsCD {
            if self.elementsAnalysis.contains(element.symbol ?? "") && (element.elValue > element.normalValue?[1] ?? 1) {
                resultIndex += 1
            }
        }
        if resultIndex == self.elementsAnalysis.count {
            self.showHealthy = true
        }
        else {
            self.showHealthy = false
        }
    }
}
