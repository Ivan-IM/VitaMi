//
//  ViewChangeManager.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import Foundation

final class ViewChanger: ObservableObject {
    
    @Published var startViewChanger: StartViewChanger = .infoView
    @Published var infoViewDismiss: Bool {
        didSet {
            UserDefaults.standard.set(infoViewDismiss, forKey: "InfoViewDismiss")
        }
    }
    @Published var mainViewChanger: MainViewChanger = .mainView
    //UserDefaults.standard.setValue(changer.mainViewChanger.rawValue, forKey: "MainViewChanger")
    
    init() {
        self.infoViewDismiss = UserDefaults.standard.object(forKey: "InfoViewDismiss") as? Bool ?? false
//        if let rawValue = UserDefaults.standard.string(forKey: "MainViewChanger-") {
//            self.mainViewChanger = MainViewChanger(rawValue: rawValue) ?? .mainView
//        }
    }
}

enum StartViewChanger: String, Codable {
    case infoView, startView
}

enum MainViewChanger: String, Codable {
    case mainView, symptomsView, symptomsListView, resultTestingView, analysisView
}

