//
//  ThirdManualView.swift
//  VitaMi
//
//  Created by Иван Маришин on 16.10.2021.
//

import SwiftUI

struct ThirdManualView: View {
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    @State private var animate: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Image("result")
                    .resizable()
                    .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 5)
                    .frame(width: width*0.6, height: height*0.6)
                    .position(x: width/2.18, y: height/2.7)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.clear)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 3))
                    .opacity(self.animate ? 1 : 0.2)
                    .scaleEffect(self.animate ? 1 : 1.1)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .frame(width: width*0.53, height: height*0.16)
                    .position(x: width/2.18, y: height/3.45)
            }
            .padding()
            Text("After the end of testing, you will receive an intermediate result.")
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding()
        }
        .onAppear {
            self.animate.toggle()
        }
    }
}

struct ThirdManualView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdManualView()
    }
}
