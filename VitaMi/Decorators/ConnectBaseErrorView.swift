//
//  ConnectBaseErrorView.swift
//  VitaMi
//
//  Created by Иван Маришин on 07.10.2021.
//

import SwiftUI

struct ConnectBaseErrorView: View {
    var body: some View {
        Image(systemName: "wifi.slash")
            .font(.system(size: 150, weight: .regular))
            .imageScale(.large)
            .foregroundColor(Color.blue)
            .shadow(color: .gray, radius: 15, x: 10, y: 10)
            .shadow(color: .white, radius: 15, x: -10, y: -10)
    }
}

struct ConnectBaseErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectBaseErrorView()
    }
}
