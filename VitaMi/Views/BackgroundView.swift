//
//  BackgroundView.swift
//  VitaMi
//
//  Created by Иван Маришин on 05.08.2021.
//

import SwiftUI

struct BackgroundView: View {
    
    @State private var brandGradient: Gradient = Gradient(colors: [Color(.systemBlue), Color(.systemTeal), Color(.systemOrange)])
    @State private var sunGradient: Gradient = Gradient(colors: [Color(.systemOrange), Color(.systemYellow), Color.white.opacity(0)])
    @State private var start = UnitPoint(x: 0.15, y: 0.15)
    @State private var animationDuration: Double = 5
    
    @State private var animate = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: brandGradient, startPoint: .topTrailing, endPoint: .bottomLeading).brightness(0.3)
                .scaleEffect(animate ? 1:1.5)
            
            LinearGradient(gradient: brandGradient, startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.3)
            
            RadialGradient(gradient: sunGradient, center: start, startRadius: 5, endRadius: 200).opacity(0.7).blur(radius: 5)
                .scaleEffect(animate ? 1:1.2)
            
            RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(0.8)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: 600)
        }
        .ignoresSafeArea()
        .onAppear() {
            animate.toggle()
        }
        .animation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true))
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
