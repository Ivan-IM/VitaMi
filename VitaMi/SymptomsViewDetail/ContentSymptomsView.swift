//
//  ContentSymptomsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct ContentSymptomsView: View {
    var body: some View {
        VStack {
            Text("Title")
            Spacer()
            Text("Some text")
            Spacer()
            HStack {
                ButtonContentSymtomsView(buttonTitle: "YES") {
                    
                }
                Spacer()
                ButtonContentSymtomsView(buttonTitle: "NO") {
                    
                }
            }
        }
        .font(.system(size: 20, weight: .semibold, design: .rounded))
        .padding(48)
    }
}

struct ContentSymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentSymptomsView()
    }
}
