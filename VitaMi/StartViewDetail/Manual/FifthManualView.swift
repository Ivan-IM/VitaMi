//
//  FifthManualView.swift
//  VitaMi
//
//  Created by Иван Маришин on 16.10.2021.
//

import SwiftUI

struct FifthManualView: View {
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    @State private var animate: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Image("analysis")
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
                    .frame(width: width*0.53, height: height*0.16)
                    .position(x: width/2.18, y: height/4.05)
                Circle()
                    .fill(.clear)
                    .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                    .opacity(self.animate ? 0.8 : 0.2)
                    .scaleEffect(self.animate ? 1 : 1.2)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                    .frame(width: width*0.11)
                    .position(x: width/3.57, y: height/1.83)
            }
            .padding()
            Text("В меню \"Анализ\", Вы можете внести результаты анализа крови на дефицит микроэлементов и витаминов, а также переключить меню \"Результаты\" на получение итогового заключения.")
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding()
        }
        .onAppear {
            self.animate.toggle()
        }
    }
}

struct FifthManualView_Previews: PreviewProvider {
    static var previews: some View {
        FifthManualView()
    }
}
