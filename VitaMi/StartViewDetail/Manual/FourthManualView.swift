//
//  FourthManualView.swift
//  VitaMi
//
//  Created by Иван Маришин on 16.10.2021.
//

import SwiftUI

struct FourthManualView: View {
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    @State private var animate: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Image("symptomsList")
                    .resizable()
                    .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 5)
                    .frame(width: width*0.6, height: height*0.6)
                    .position(x: width/2.9, y: height/3.1)
                Image("main")
                    .resizable()
                    .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 5)
                    .frame(width: width*0.6, height: height*0.6)
                    .position(x: width/1.75, y: height/2.3)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.clear)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 3))
                    .opacity(self.animate ? 0.8 : 0.2)
                    .scaleEffect(self.animate ? 1 : 1.1)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .frame(width: width*0.24, height: height*0.11)
                    .position(x: width/1.38, y: height/2.127)
            }
            .padding()
            Text(NSLocalizedString("At any time you can check the selected symptoms in the list, as well as change the selection. The intermediate result will automatically change.", comment: ""))
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding()
        }
        .onAppear {
            self.animate.toggle()
        }
    }
}

struct FourthManualView_Previews: PreviewProvider {
    static var previews: some View {
        FourthManualView()
    }
}
