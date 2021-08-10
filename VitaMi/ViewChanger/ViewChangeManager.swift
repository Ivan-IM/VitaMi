//
//  ViewChangeManager.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import Foundation

final class ViewChanger: ObservableObject {
    @Published var changer: LoadingView = .startView
}

enum LoadingView {
    case startView
}
