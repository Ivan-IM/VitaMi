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
            Text(element.enName)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            ScrollView {
                Text(element.elementInfo)
                    .padding(8)
            }
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 2))
            .padding(2)
            Form {
                Section(header: Text("FOOD")){
                    ForEach(element.ruProductInfo, id: \.self) { prod in
                        Text(prod)
                    }
                }
            }
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 2))
            .padding(2)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Image(systemName: "chevron.left.circle")
                        .font(.title2)
                    Text("Result")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                }
            })
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1.0)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
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
