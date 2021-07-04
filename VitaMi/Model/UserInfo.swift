//
//  UserInfo.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

class User: ObservableObject {
    static var user = User()
    
    @Published var symptomsList: [String] = fetchData(User.user)()
    
    let userDefaults = UserDefaults.standard
    let key = "SymptomsList"
    
    init() {}
    
    func fetchData() -> [String] {
        if let data = userDefaults.value(forKey: key) as? [String] {
            return data
        }
        return []
    }
    
    func save(symptom: String) {
        var data = fetchData()
        data.append(symptom)
        userDefaults.set(data, forKey: key)
    }
}
