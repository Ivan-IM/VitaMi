//
//  BiochemicalAnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct BiochemicalAnalysisView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Element.getElementsList()) { element in
                if user.lowElementsList.contains(element.symbol) {
                    ZStack {
                        Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)).cornerRadius(20).opacity(0.8)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.7), radius: 3, x: 0, y: 0)
                        
                        HStack {
                            Text(element.ruName)
                                .foregroundColor(Color.black)
                            
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    }
                    .frame(height: 40)
                    .padding(.vertical, 2.0)
                    .padding(.horizontal, 10.0)
                }
            }
        }
    }
}

struct BiochemicalAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        BiochemicalAnalysisView()
    }
}
