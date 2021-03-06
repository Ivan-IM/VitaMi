//
//  SixthManualView.swift
//  VitaMi
//
//  Created by Иван Маришин on 17.10.2021.
//

import SwiftUI

struct SixthManualView: View {
    
    @EnvironmentObject var changer: ViewChanger
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image("finalResult")
                        .resizable()
                        .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 5)
                        .frame(width: width*0.5, height: height*0.5)
                        .position(x: width/3.5, y: height/3.8)
                    Image("elementInfo")
                        .resizable()
                        .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 5)
                        .frame(width: width*0.5, height: height*0.5)
                        .position(x: width/2.18, y: height/2.7)
                    Image("elementFood")
                        .resizable()
                        .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 5)
                        .frame(width: width*0.5, height: height*0.5)
                        .position(x: width/1.6, y: height/2.1)
                }
                .padding()
                    Text(NSLocalizedString("The system will automatically correct the results, give a brief information on the selected item and show a list of food products with a high content of this microelement or vitamin.", comment: ""))
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .padding()
            }
            Button {
                changer.infoViewDismiss = true
            } label: {
                Image(systemName: "chevron.right.circle.fill")
                    .font(.system(size: 30, weight: .regular))
                    .imageScale(.large)
                    .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 5)
                    .opacity(self.animate ? 0.8 : 0.2)
                    .scaleEffect(self.animate ? 1 : 1.2)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                    .position(x: width/1.1, y: height/1.35)
            }
        }
        .onAppear {
            self.animate.toggle()
        }
    }
}

struct SixthManualView_Previews: PreviewProvider {
    static var previews: some View {
        SixthManualView()
    }
}
