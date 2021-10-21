//
//  SecondManualView.swift
//  VitaMi
//
//  Created by Иван Маришин on 16.10.2021.
//

import SwiftUI

struct SecondManualView: View {
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    @State private var animate: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Image("testing")
                    .resizable()
                    .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 5)
                    .frame(width: width*0.6, height: height*0.6)
                    .position(x: width/2.18, y: height/2.7)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.clear)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 3))
                    .opacity(self.animate ? 0.8 : 0.2)
                    .scaleEffect(self.animate ? 1 : 1.05)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .frame(width: width*0.53, height: height*0.09)
                    .position(x: width/2.18, y: height/1.92)
            }
            .padding()
            Text(NSLocalizedString("During testing, select the symptoms that you think have appeared recently and are not associated with any disease at the time of testing.", comment: ""))
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding()
        }
        .onAppear {
            self.animate.toggle()
        }
    }
}

struct SecondManualView_Previews: PreviewProvider {
    static var previews: some View {
        SecondManualView()
    }
}
