//
//  ResultTestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct ResultTestingView: View {
    
    @EnvironmentObject var chager: ViewChanger
    @EnvironmentObject var user: User
    
    var body: some View {
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
    }
}

struct ResultTestingView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTestingView().environmentObject(User()).environmentObject(ViewChanger())
    }
}
