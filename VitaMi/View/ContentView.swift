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
                .shadow(color: .yellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
