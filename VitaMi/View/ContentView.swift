//
//  ContentView.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var user = User()
    let pathBounds = UIBezierPath.calculateBounds(paths: [.logoPath1])
    
    var body: some View {
        NavigationView {
            VStack {
                ShapeView(bezier: .logoPath1, pathBounds: pathBounds)
                    .stroke(Color.red, lineWidth: 5)
                    .frame(width: 150, height: 150, alignment: .center)
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("Name", text: $user.name)
                            .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                        TextField("Gender", text: $user.gender)
                            .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                        TextField("Age", text: $user.age)
                            .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                    }
                    Section(header: Text("Testing")) {
                        NavigationLink(
                            destination: SymptomsTestingView(),
                            label: {
                                Text("Symptoms testing")
                                    .fontWeight(.bold)
                            })
                        NavigationLink(
                            destination: BiochemicalAnalysisView(),
                            label: {
                                Text("Biochemical Analysis")
                                    .fontWeight(.bold)
                            })
                    }
                }
            }
            .navigationTitle("Profile")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
