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
            ZStack {
                VStack {
                    Form {
                        Section(header: Text("Personal Info")) {
                            TextField("Name", text: $user.name)
                            TextField("Gender", text: $user.gender)
                            TextField("Age", text: $user.age)
                        }
                        Section(header: Text("Testing")) {
                            NavigationLink(
                                destination: SymptomsView(),
                                label: {
                                    Text("Symptoms List")
                                })
                            NavigationLink(
                                destination: BloodTestView(),
                                label: {
                                    Text("Biochemical analysis")
                                })
                            NavigationLink(
                                destination: ResultView(),
                                label: {
                                    Text("Result")
                                })
                        }
                    }
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear(){
            if let symptomsList = UserDefaults.standard.array(forKey: "SymptomsList") {
                for i in symptomsList{
                    user.symptomsList.append(i as! String)
                }
            }
            else {
                print("Data Erorr")
                return
            }
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
