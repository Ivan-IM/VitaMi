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
            Text("Добро пожаловать в лабораторию VitaMi.")
                .multilineTextAlignment(.center)
                .font(.system(size: 26, weight: .semibold, design: .rounded))
            Text("Нарушение баланса микроэлементов и витаминов в организме - очень распространенное явление, зачастую мы этого не замечаем или списываем на общую усталость, недостаток сна, энергетических ресурсов, плохое настроение. Однако данная симптоматика очень часто является следствием нарушение баланса в нашем организме.")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
