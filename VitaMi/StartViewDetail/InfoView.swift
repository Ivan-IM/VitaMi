//
//  InfoView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.08.2021.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            Text("""
                Some information
                about micronutrient
                imbalance
                """)
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
