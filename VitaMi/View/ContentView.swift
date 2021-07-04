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
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                })
                .padding(.all)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 5, x: 3, y: 3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
