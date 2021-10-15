//
//  TitleResultView.swift
//  VitaMi
//
//  Created by Иван Маришин on 14.10.2021.
//

import SwiftUI

struct TitleResultView: View {
    
    @EnvironmentObject var user: UserManager
    let titleResultElementsDeficit: String = "Симптомы характерны для дефицита или сниженного потребления следующих микроэлементов и витаминов. Для более точного результата необходимо сдать анализ крови в любой клининке."
    let titleHealthy: String = "Ваше состояние не указывает на дефицит или сниженное потребление каких-либо микроэлементов и витаминов."
    let titleAnalysisElementsDeficit0: String = "Результаты анализа характерны для"
    let titleAnalysisElementsDeficit1: String = "дефицитного состояния"
    let titleAnalysisElementsDeficit2: String = "сниженного потребления"
    let titleAnalysisElementsDeficit3: String = "следующих микроэлементов и витаминов."
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16).stroke(Color.gray.opacity(0.5))
                .frame(height: 110)
            Group {
                if user.showFinalResult {
                    if user.showHealthy {
                        Text(titleHealthy)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(Color("text"))
                            .padding(8)
                    } else {
                        VStack {
                            Text(titleAnalysisElementsDeficit0)
                                .foregroundColor(Color("text"))
                            HStack {
                                Text(titleAnalysisElementsDeficit1)
                                Image(systemName: "minus.circle")
                            }
                            .foregroundColor(Color.red)
                            HStack {
                                Text(titleAnalysisElementsDeficit2)
                                Image(systemName: "arrow.down.circle")
                            }
                            .foregroundColor(Color.orange)
                            Text(titleAnalysisElementsDeficit3)
                                .foregroundColor(Color("text"))
                        }
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("text"))
                        .padding(8)
                    }
                    
                }
                else {
                    Text(user.lowElementsList.isEmpty ? titleHealthy:titleResultElementsDeficit)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("text"))
                        .padding(8)
                }
            }
        }
    }
}
