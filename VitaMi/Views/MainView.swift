//
//  MainView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.08.2021.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var changer: ViewChanger
    
    var body: some View {
        VStack {
            UserFormView()
            Spacer()
            TestingButtonMainView()
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
