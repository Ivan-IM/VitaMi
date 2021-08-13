//
//  ViewChangeManager.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import Foundation

final class ViewChanger: ObservableObject {
    
    @Published var startViewChanger: StartViewChanger = .info
    @Published var mainViewChanger: MainViewChanger = .startView
    @Published var testingViewChanger: TestingViewChanger?
    
    init() {
        if let rawValue = UserDefaults.standard.string(forKey: "ainViewChanger") {
            self.mainViewChanger = MainViewChanger(rawValue: rawValue) ?? .startView
        }
    }
}

enum StartViewChanger {
    case info, login
}

enum MainViewChanger: String, Codable {
    case startView, mainView, symptomsView, resultTestingView
}

enum TestingViewChanger {
    case symptoms, result
}
