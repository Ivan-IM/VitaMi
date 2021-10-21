//
//  TitleResultView.swift
//  VitaMi
//
//  Created by Иван Маришин on 14.10.2021.
//

import SwiftUI

struct TitleResultView: View {
    
    @EnvironmentObject var user: UserManager
    private let titleResultElementsDeficit = NSLocalizedString("Symptoms are characteristic of a deficiency or reduced intake of the following trace elements and vitamins. For a more accurate result, it is necessary to take a blood test in any clinic.", comment: "")
    private let titleHealthy = NSLocalizedString("Your condition does not indicate a deficiency or reduced intake of any micronutrients and vitamins.", comment: "")
    private let titleAnalysisElementsDeficit0: String = NSLocalizedString("The analysis results are specific to", comment: "")
    private let titleAnalysisElementsDeficit1: String = NSLocalizedString("deficit state", comment: "")
    private let titleAnalysisElementsDeficit2: String = NSLocalizedString("reduced consumption", comment: "")
    private let titleAnalysisElementsDeficit3: String = NSLocalizedString("the following trace elements and vitamins.", comment: "")
    
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
