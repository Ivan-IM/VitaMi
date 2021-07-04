//
//  ContentView.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var user = User()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: SymptomsView(),
                    label: {
                        Text("Symptoms List")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                    })
                    .padding()
                    .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 5, x: 3, y: 3)
                NavigationLink(
                    destination: ResultView(),
                    label: {
                        Text("Result List")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                    })
                    .padding()
                    .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 5, x: 3, y: 3)
            }
        }
        .onAppear(){
            if let symptomsList = UserDefaults.standard.array(forKey: "SymptomsList") {
                for i in symptomsList{
                    self.user.symptomsList.append(i as! String)
                }
            }
            else {
                print("Data Erorr")
                return
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .environmentObject(user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
