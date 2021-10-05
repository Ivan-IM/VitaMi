//
//  ElementDetailView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct ElementDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let element: Element
    
    var body: some View {
        VStack {
            Text(element.ruName)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            ScrollView {
                Text(element.elementInfo)
                    .padding(8)
            }
            
            Text("Продукты питания с высоким содержанием:")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            List {
                ForEach(element.ruProductInfo, id: \.self) { prod in
                    Text(prod)
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Image(systemName: "chevron.left.circle")
                        .font(.title2)
                    Text("Результаты")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                }
            })
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color("backgroundColorSet"))
        .navigationBarHidden(true)
        .onAppear() {
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

struct ElementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ElementDetailView(element: Element(symbol: "Fe", enName: "Iron", ruName: "Железо", type: "", elementInfo: "bla bla bla bla bla", ruProductInfo: ["bla", "bla"], normalValue: [:], helper: [], blocker: []))
    }
}
