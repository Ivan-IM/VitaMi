//
//  MainView.swift
//  VitaMi
//
//  Created by Иван Маришин on 05.08.2021.
//

import SwiftUI

struct MainView: View {
    private let pathBounds = UIBezierPath.calculateBounds(paths: [.logoPath1])
    @State var endAmount: CGFloat = 0
    
    var body: some View {
        VStack {
            ZStack {
                ShapeView(bezier: .logoPath1, pathBounds: pathBounds)
                    .trim(from: 0, to: endAmount)
                    .stroke(Color.black, lineWidth: 3)
            }
            .frame(width: 300, height: 300, alignment: .center)
            .onAppear {
                withAnimation(.easeInOut(duration: 2)) {
                    self.endAmount = 1
                }
            }
            
            FormView()
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(User())
    }
}
