//
//  VitaMiApp.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

@main
struct VitaMiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(User())
                .environmentObject(ViewChanger())
        }
    }
}
