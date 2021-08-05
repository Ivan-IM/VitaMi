//
//  ButtonLoginView.swift
//  VitaMi
//
//  Created by Иван Маришин on 05.08.2021.
//

import SwiftUI

struct ButtonLoginView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("OK")
        })
    }
}

struct ButtonLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLoginView()
    }
}
