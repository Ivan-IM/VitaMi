//
//  ViewChangeManager.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import Foundation

final class ViewChanger: ObservableObject {
    
    @Published var infoViewDismiss: Bool {
        didSet {
            UserDefaults.standard.set(infoViewDismiss, forKey: "InfoViewDismiss")
        }
    }
    @Published var mainViewChanger: MainViewChanger = .mainView
    
    init() {
        self.infoViewDismiss = UserDefaults.standard.object(forKey: "InfoViewDismiss") as? Bool ?? false
    }
}

enum MainViewChanger: String, Codable {
    case mainView, symptomsView, symptomsListView, resultTestingView, analysisView
}

