//
//  ResultTestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct ResultTestingView: View {
    
    @EnvironmentObject var user: User
    @State private var viewHidden = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("You are healthy!")
                    .font(.title3)
            }
            .hidden()
            ScrollView(showsIndicators: false) {
                ForEach(Element.getElementsList()) { element in
                    if user.lowElementsList.contains(element.symbol) {
                        NavigationLink(destination: DetailView(element: element)) {
                            HStack {
                                Text(element.ruName)
                                    .foregroundColor(Color("text"))
                                Spacer()
                                Image(systemName: "questionmark.circle")
                            }
                            .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                        }
                        .frame(height: 40)
                        .overlay(Capsule(style: .continuous).stroke())
                        .padding(.vertical, 2.0)
                        .padding(.horizontal, 10.0)
                    }
                }
            }
        }
    }
}

struct ResultTestingView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTestingView()
    }
}

struct DetailView: View {
    
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
