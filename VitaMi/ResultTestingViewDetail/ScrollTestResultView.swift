//
//  ScrollTestResultView.swift
//  VitaMi
//
//  Created by Иван Маришин on 14.10.2021.
//

import SwiftUI

struct ScrollTestResultView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(user.elementsCD) { element in
                if user.lowElementsList.contains(element.symbol ?? "") {
                    CustomCellResultTestingView(element: element, textColor: Color("text"))
                        .padding(.vertical, 3.0)
                        .padding(.horizontal, 10.0)
                }
            }
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
    }
}
