//
//  TestingView.swift
//  VitaMi
//
//  Created by Иван Маришин on 09.07.2021.
//

import SwiftUI

struct TestingView: View {
    var body: some View {
        TabView {
            SymptomsListView()
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
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
