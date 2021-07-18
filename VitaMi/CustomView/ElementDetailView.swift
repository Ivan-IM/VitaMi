//
//  ElementDetailView.swift
//  VitaMi
//
//  Created by Иван Маришин on 18.07.2021.
//

import SwiftUI

struct ElementDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let element: Element
    
    var body: some View {
        VStack {
            Text(element.ruName)
                .padding()
            Text("Продукты с высоким содержанием:")
                .padding()
            List() {
                ForEach(element.ruProductInfo, id: \.self) { el in
                    Text(el)
                }
            }
            .padding()
            ScrollView {
                Text(element.elementInfo)
            }
            .padding()
            Spacer()
            Button("Dismiss Me") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
    }
}
