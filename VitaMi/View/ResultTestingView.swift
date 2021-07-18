//
//  ResultTestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct ResultTestingView: View {
    
    @EnvironmentObject var user: User
    let pathBounds = UIBezierPath.calculateBounds(paths: [.logoPath1])
    @State private var viewHidden = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("You are healthy!")
                    .font(.title)
                Text("Your symptoms are not related to micronutrient deficiencies")
                    .multilineTextAlignment(.center)
                ShapeView(bezier: .logoPath1, pathBounds: pathBounds)
                    .stroke(Color.red, lineWidth: 5)
                    .frame(width: 300, height: 300, alignment: .center)
                    .padding()
            }
            .opacity(viewHidden ? 1:0)
            ScrollView(showsIndicators: false) {
                ForEach(Element.getElementsList()) { element in
                    if user.lowElementsList.contains(element.symbol) {
                        NavigationLink(destination: ElementDetailView(element: element)) {
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
            .opacity(viewHidden ? 0:1)
        }
        .onAppear() {
            if user.lowElementsList.isEmpty {
                viewHidden = true
            }
            else { return }
        }
    }
}

struct ResultTestingView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTestingView()
    }
}
