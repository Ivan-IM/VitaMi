//
//  ScrollViewAnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct ScrollViewAnalysisView: View {
    
    @EnvironmentObject var user: User
    
    private let colums = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: colums) {
                ForEach(user.elementsAnalysis) { element in
                    CustomCellAnalysisView(title: element.symbol)
                }
            }
        }
        .padding(.vertical, 2)
        .padding(.horizontal, 8)
    }
}

struct ScrollViewAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewAnalysisView()
            .environmentObject(User())
    }
}
