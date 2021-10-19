//
//  InfoView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.08.2021.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            Text("Welcome to the VitaMi laboratory.")
                .multilineTextAlignment(.center)
                .font(.system(size: 22, weight: .semibold, design: .rounded))
            Text("The imbalance of micronutrients and vitamins in the body is a very common phenomenon, we often do not notice it or blame it on lack of sleep, energy resources and bad mood. However, this symptomatology is very often the result of a violation of a balanced diet, unbalanced diets and insufficient consumption of a number of foods.")
                .multilineTextAlignment(.center)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .padding()
            Spacer()
            Text("The application is not a full-fledged diagnostic tool. The development of this system is aimed at drawing attention to the imbalance in the diet in the modern world, as well as to draw public attention to the indiscriminate intake of dietary supplements, trace elements and vitamins.")
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
