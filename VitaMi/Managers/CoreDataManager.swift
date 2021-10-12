//
//  CoreDataManager.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.10.2021.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "ElementCoreDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("CoreData failed \(error.localizedDescription)")
            }
            else {
                
            }
        }
    }
    
    func updateCD() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save \(error)")
        }
    }
    
    func deleteElements(element: ElementCD) {
        
        persistentContainer.viewContext.delete(element)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save \(error)")
        }
    }
    
    func deleteSymptoms(symptom: SymptomCD) {
        
        persistentContainer.viewContext.delete(symptom)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save \(error)")
        }
    }
    
    func getElements() -> [ElementCD] {
        
        let fetchRequest: NSFetchRequest<ElementCD> = ElementCD.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func getSymptoms() -> [SymptomCD] {
        
        let fetchRequest: NSFetchRequest<SymptomCD> = SymptomCD.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveElement(element: Element) {
        
        let elementCD = ElementCD(context: persistentContainer.viewContext)
        
        elementCD.symbol = element.symbol
        elementCD.ruName = element.ruName
        elementCD.enName = element.enName
        elementCD.ruProductInfo = element.ruProductInfo
        elementCD.elementInfo = element.elementInfo
        elementCD.normalValue = element.normalValue
        elementCD.blocker = element.blocker
        elementCD.helper = element.helper
        elementCD.type = element.type
        elementCD.measure = element.measure
        elementCD.value = element.value ?? 0.0
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save \(error)")
        }
    }
    
    func saveSymptom(symptom: Symptom) {
        
        let symptomCD = SymptomCD(context: persistentContainer.viewContext)
        
        symptomCD.enName = symptom.enName
        symptomCD.ruName = symptom.ruName
        symptomCD.elements = symptom.elements
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save \(error)")
        }
    }
}
