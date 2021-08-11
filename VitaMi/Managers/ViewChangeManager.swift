//
//  ViewChangeManager.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import Foundation

final class ViewChanger: ObservableObject {
    @Published var startViewChanger: StartViewChanger = .info
    @Published var mainViewChanger: MainViewChanger = .startView {
        didSet {
            UserDefaults.standard.setValue(mainViewChanger.rawValue, forKey: "MainViewChanger")
        }
    }
    @Published var animator = false
    
    init() {
        if let rawValue = UserDefaults.standard.string(forKey: "StartViewChanger") {
            self.mainViewChanger = MainViewChanger(rawValue: rawValue) ?? .startView
        }
    }
}

enum StartViewChanger {
    case info, login
}

enum MainViewChanger: String, Codable {
    case startView, mainView, symtomsView, resultView
}

