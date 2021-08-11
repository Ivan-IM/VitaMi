//
//  SymptomsListView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct SymptomsView: View {
    
    @EnvironmentObject var chager: ViewChanger
    @EnvironmentObject var user: User
    
    var body: some View {
        ZStack {
            VStack {
                ScrollViewSsView()
            }
        }
        .onDisappear() {
            user.elementsFilterAlgorithm()
        }
    }
}

struct SymptomsListView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
            .environmentObject(User())
            .environmentObject(ViewChanger())
    }
}


