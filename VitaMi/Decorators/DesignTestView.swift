//
//  DesignTestView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.08.2021.
//

import SwiftUI

struct DesignTestView: View {
    
    @EnvironmentObject var user: User
    @State private var showingDetail = false
    
    var body: some View {
        ZStack {
            Color("background")
            CustomButtonMainView(buttonTitle: "Button adsdasdasd", imageName: "leaf.circle", imageColor: Color.blue, action: {
                
            }, width: 150, height: 150)
        }
    }
}

struct DesignTestView_Previews: PreviewProvider {
    static var previews: some View {
        DesignTestView()
            .preferredColorScheme(.light)
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
