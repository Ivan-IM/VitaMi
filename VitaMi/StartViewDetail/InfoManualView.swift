//
//  InfoManualView.swift
//  VitaMi
//
//  Created by Иван Маришин on 16.10.2021.
//

import SwiftUI

struct InfoManualView: View {
    var body: some View {
        TabView {
            InfoView()
            FirstManualView()
            SecondManualView()
            ThirdManualView()
            FourthManualView()
            FifthManualView()
            SixthManualView()
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct InfoManualView_Previews: PreviewProvider {
    static var previews: some View {
        InfoManualView()
    }
}
