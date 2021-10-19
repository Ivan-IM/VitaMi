//
//  TitleResultView.swift
//  VitaMi
//
//  Created by Иван Маришин on 14.10.2021.
//

import SwiftUI

struct TitleResultView: View {
    
    @EnvironmentObject var user: UserManager
    let titleResultElementsDeficit: String = "Symptoms are characteristic of a deficiency or reduced intake of the following trace elements and vitamins. For a more accurate result, it is necessary to take a blood test in any clinic."
    let titleHealthy: String = "Your condition does not indicate a deficiency or reduced intake of any micronutrients and vitamins."
    let titleAnalysisElementsDeficit0: String = "The analysis results are specific to"
    let titleAnalysisElementsDeficit1: String = "deficit state"
    let titleAnalysisElementsDeficit2: String = "reduced consumption"
    let titleAnalysisElementsDeficit3: String = "the following trace elements and vitamins."
    
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
