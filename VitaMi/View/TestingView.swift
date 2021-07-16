//
//  TestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct TestingView: View {
    
    @EnvironmentObject var user: User
    @State private var showingClearAlert = false
    @State private var showingAlert = false
    
    var body: some View {
        TabView {
            SymptomsListView()
                .onDisappear(){
                    user.elementsFilterAlgorithm()
                    if !user.lowElementsList.isEmpty {
                        showingAlert.toggle()
                    }
                    else { return }
                }
                .tabItem {
                    Image(systemName: "hand.point.up.braille")
                    Text("Symptoms")
                }
            ResultTestingView()
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Result")
                }
                .alert(isPresented: $showingAlert, content: {
                    Alert(title: Text("You have a micronutrient imbalance"), message: Text("Please do a blood test and check it"), dismissButton: .default(Text("OK")))
                })
        }
        .navigationTitle("Testing")
        .navigationBarItems(trailing: Button(action: {
            showingClearAlert.toggle()
        }, label: {
            Text("Clear")
        })).alert(isPresented: $showingClearAlert) {
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
