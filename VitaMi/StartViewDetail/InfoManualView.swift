//
//  InfoManualView.swift
//  VitaMi
//
//  Created by Иван Маришин on 16.10.2021.
//

import SwiftUI

struct InfoManualView: View {
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    @State private var selectedTab = 0
    @State private var animate: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            InfoView()
                .offset(x: animate ? -16 : 0, y: 0)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever().delay(15))
                .onAppear {
                    animate.toggle()
                }
            FirstManualView()
                .tag(1)
            SecondManualView()
                .tag(2)
            ThirdManualView()
                .tag(3)
            FourthManualView()
                .tag(4)
            FifthManualView()
                .tag(5)
            SixthManualView()
                .tag(6)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct InfoManualView_Previews: PreviewProvider {
    static var previews: some View {
        InfoManualView()
            .environmentObject(ViewChanger())
    }
}
