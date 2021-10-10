//
//  CustomCellAnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct CustomCellAnalysisView: View {
    
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
        }
    }
}

struct CustomCellAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCellAnalysisView(title: "Na")
    }
}
