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
    
    init() {
        if let rawValue = UserDefaults.standard.string(forKey: "MainViewChanger-") {
            self.mainViewChanger = MainViewChanger(rawValue: rawValue) ?? .startView
        }
    }
}

enum StartViewChanger {
    case info, welcom
}

enum MainViewChanger: String, Codable {
    case startView, mainView, symptomsView, symptomsListView, resultTestingView, analysisView
}

