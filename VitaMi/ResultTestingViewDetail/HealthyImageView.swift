//
//  HealthyImageView.swift
//  VitaMi
//
//  Created by Иван Маришин on 05.10.2021.
//

import SwiftUI

struct HealthyImageView: View {
    var body: some View {
        Image(systemName: "leaf.arrow.triangle.circlepath")
            .font(.system(size: 150, weight: .regular))
            .imageScale(.large)
            .foregroundColor(Color.blue)
            .shadow(color: .gray, radius: 15, x: 10, y: 10)
            .shadow(color: .white, radius: 15, x: -10, y: -10)
    }
}

struct HealthyImageView_Previews: PreviewProvider {
    static var previews: some View {
        HealthyImageView()
    }
}
