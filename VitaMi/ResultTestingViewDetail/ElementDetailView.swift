//
//  ElementDetailView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct ElementDetailView: View {
    
    @EnvironmentObject var userManager: UserManager
    @Environment(\.presentationMode) var presentationMode
    let element: ElementCD
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                Text("\(userManager.ruLocalization ? element.ruName ?? "" : element.enName ?? "")(\(element.symbol ?? ""))")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
                    .padding()
                ScrollView {
                    Text(element.elementInfo ?? "")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("text"))
                }
                .padding()
            }
        }
    }
}
