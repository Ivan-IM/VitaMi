//
//  SwiftUIView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct BloodTestView: View {
    
    @EnvironmentObject var user: User
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        Text("loading view")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BloodTestView()
    }
}
