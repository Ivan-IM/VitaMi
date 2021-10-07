//
//  VitaMiApp.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct VitaMiApp: App {
    
    init() {
        FirebaseApp.configure()
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously()
          }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(User())
                .environmentObject(ViewChanger())
        }
    }
}
