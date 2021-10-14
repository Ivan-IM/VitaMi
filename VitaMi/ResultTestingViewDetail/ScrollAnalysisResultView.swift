//
//  ScrollAnalysisResultView.swift
//  VitaMi
//
//  Created by Иван Маришин on 14.10.2021.
//

import SwiftUI

struct ScrollAnalysisResultView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(user.elementsCD) { element in
                if user.elementsAnalysis.contains(element.symbol ?? "") && (element.elValue >= element.normalValue?[0] ?? 0) && (element.elValue <= element.normalValue?[1] ?? 1) {
                    CustomCellResultTestingView(element: element, textColor: .orange)
                        .padding(.vertical, 3.0)
                        .padding(.horizontal, 10.0)
                }
                if user.elementsAnalysis.contains(element.symbol ?? "") && (element.elValue <= element.normalValue?[0] ?? 0.1) {
                    CustomCellResultTestingView(element: element, textColor: .red)
                        .padding(.vertical, 3.0)
                        .padding(.horizontal, 10.0)
                }
            }
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .onAppear {
            user.showHealthyStatus()
        }
    }
}
