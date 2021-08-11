//
//  DesignTestView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.08.2021.
//

import SwiftUI

struct DesignTestView: View {
    var body: some View {
        ZStack {
            Color("backgroundColorSet")
                .ignoresSafeArea()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .buttonStyle(CustomButtonStyle())
        }
    }
}

struct DesignTestView_Previews: PreviewProvider {
    static var previews: some View {
        DesignTestView()
    }
}
