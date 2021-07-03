//
//  ContentView.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            
            NavigationLink(
                destination: SymptomsView(),
                label: {
                    Text("User Testing")
                })
                .padding(.all)
                .background(Color.green)
                .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
