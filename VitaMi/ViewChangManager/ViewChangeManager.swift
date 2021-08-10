//
//  ViewChangeManager.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import Foundation

final class ViewChanger: ObservableObject {
    @Published var loading: LoadingView = .startView
}

enum LoadingView {
    case startView, loginView, mainView, symtomsView, resultView
}
