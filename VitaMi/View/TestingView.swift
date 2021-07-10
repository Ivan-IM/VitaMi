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
                    user.elementsFilterAlgorithm()
                }
                .tabItem {
                    Image(systemName: "hand.point.up.braille")
                    Text("Symptoms")
                }
            ResultTestingView()
                .tabItem {
                    Image(systemName: "leaf.arrow.triangle.circlepath")
                    Text("Result")
                }
            BiochemicalAnalysisView()
                .tabItem {
                    Image(systemName: "eyedropper.halffull")
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
            }), secondaryButton: .cancel())
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
