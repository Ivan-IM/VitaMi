//
//  TestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct TestingView: View {
    
    @EnvironmentObject var user: User
    @State private var showingAlert = false
    
    var body: some View {
        TabView {
            SymptomsListView()
                .onDisappear(){
                    UserDefaults.standard.set(user.symptomsList, forKey: "SymptomsList")
                    user.lowElementsList.removeAll()
                    user.elementsFilterAlgorinm()
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Symptoms")
                }
            ResultTestingView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Result")
                }
            BiochemicalAnalysisView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("BioAnalysis")
                }
        }
        .navigationTitle("Testing")
        .navigationBarItems(trailing: Button(action: {
            showingAlert.toggle()
        }, label: {
            Text("Clear")
        })).alert(isPresented: $showingAlert) {
            Alert(title: Text("Clear"), message: Text("Are you want clear symptoms list?"), primaryButton: .destructive(Text("Ok"), action: {
                user.symptomsList.removeAll()
                user.lowElementsList.removeAll()
                UserDefaults.standard.set(user.symptomsList, forKey: "SymptomsList")
            }), secondaryButton: .cancel())
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
