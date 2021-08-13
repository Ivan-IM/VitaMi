//
//  TestingButtonView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct TestingButtonMainView: View {
    
    @EnvironmentObject var changer: ViewChanger
    
    var body: some View {
        Button(action: {
            changer.mainViewChanger = .symptomsView
        }, label: {
            Text("Start test")
                .frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
        .buttonStyle(CustomButtonStyle())
    }
}

struct TestingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TestingButtonMainView()
            .environmentObject(ViewChanger())
    }
}
