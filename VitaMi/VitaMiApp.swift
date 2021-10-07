//
//  VitaMiApp.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI
import Firebase

@main
struct VitaMiApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(User())
                .environmentObject(ViewChanger())
        }
    }
}
