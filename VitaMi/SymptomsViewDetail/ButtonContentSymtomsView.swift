//
//  ButtonContentSymtomsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct ButtonContentSymtomsView: View {
    
    var buttonTitle: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(buttonTitle)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
        .buttonStyle(CustomButtonStyle())
    }
}
