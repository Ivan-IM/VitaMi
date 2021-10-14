//
//  TitleResultView.swift
//  VitaMi
//
//  Created by Иван Маришин on 14.10.2021.
//

import SwiftUI

struct TitleResultView: View {
    
    @EnvironmentObject var user: User
    let titleResultElementsDeficit: String = "Симптомы характерны для дефицита или сниженного потребления следующих микроэлементов и витаминов. Для более точного результата необходимо сдать анализ крови в любой клининке."
    let titleHealthy: String = "Ваше состояние не указывает на дефицит или сниженное потребление каких-либо микроэлементов и витаминов."
    let titleAnalysisElementsDeficit: String = "Результаты анализа характерны для дефицита или сниженного потребления следующих микроэлементов и витаминов."
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16).stroke(Color.gray.opacity(0.5))
                .frame(height: 110)
            Group {
                if user.showFinalResult {
                    Text(user.showHealthy ? titleHealthy:titleAnalysisElementsDeficit)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("text"))
                }
                else {
                    Text(user.lowElementsList.isEmpty ? titleHealthy:titleResultElementsDeficit)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("text"))
                }
            }
        }
    }
}
