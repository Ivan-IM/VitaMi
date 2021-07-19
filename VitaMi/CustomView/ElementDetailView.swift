//
//  ElementDetailView.swift
//  VitaMi
//
//  Created by Иван Маришин on 18.07.2021.
//

import SwiftUI

struct ElementDetailView: View {
    
    let element: Element
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Продукты с высоким содержанием:")) {
                    List() {
                        ForEach(element.ruProductInfo, id: \.self) { el in
                            Text(el)
                        }
                    }
                }
                Section(header: Text("Справочная информация:")) {
                        Text(element.elementInfo)
                }
            }
        }
        .navigationTitle(Text("\(element.ruName) (\(element.symbol))"))
    }
}
