//
//  FirstManualView.swift
//  VitaMi
//
//  Created by Иван Маришин on 16.10.2021.
//

import SwiftUI

struct FirstManualView: View {
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            ZStack {
                Image("")
            }
            Text("Изначально рекомендуем пройти тестирование.")
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding()
        }
    }
}

struct FirstManualView_Previews: PreviewProvider {
    static var previews: some View {
        FirstManualView()
    }
}
