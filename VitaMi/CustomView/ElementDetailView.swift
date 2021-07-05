//
//  File.swift
//  VitaMi
//
//  Created by Иван Маришин on 05.07.2021.
//

import SwiftUI

struct ElementDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
    }
}
