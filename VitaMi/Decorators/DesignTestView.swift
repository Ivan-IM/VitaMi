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
            Button(action: {
                
            }, label: {
                Text("Button")
                    .frame(width: 150, height: 50)
            })
                .buttonStyle(CustomMinButtonStyle())
        }
    }
}

struct DesignTestView_Previews: PreviewProvider {
    static var previews: some View {
        DesignTestView()
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
